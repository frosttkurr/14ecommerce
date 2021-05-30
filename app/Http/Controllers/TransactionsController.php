<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;
use GuzzleHttp\Client;
use Carbon\Carbon;
use App\Transaction;
use App\Transaction_Detail;
use App\Product;
use App\Courier;
use App\Product_Image; 
use App\Product_Review; 
use App\Cart;
use App\City;
use App\Province;
use App\Discount;
use App\Admin;
use App\Response;
use Kavist\RajaOngkir\Facades\RajaOngkir;
use App\Notifications\NewTransaction;
use App\Notifications\UploadProof;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;


class TransactionsController extends Controller
{
    /**
        * Display a listing of the resource.
        *
        * @return \Illuminate\Http\Response
    */


    public function  construct()
    {
        $this->middleware(['auth', 'verified']);
    }

    public function index()
    {
        $user = Auth::id();
        $checkout = session('checkout');
        $product = $checkout['product_id'];
        $cart = Cart::with('product')->where('user_id', $checkout['user_id'])->where('status', 'notyet')->get();
        $discount = Discount::where('id_product', $product)->get();
        $province = Province::pluck('title', 'province_id');
        $courier = Courier::pluck('courier', 'id');
        return view('checkout.checkout', compact('cart', 'product', 'province', 'courier', 'discount'));
    }

    public function adminIndex()
    {
        $transactions = Transaction::with('user')->orderBy('created_at', 'DESC')->get();
        return view('transactions.transactions', compact('transactions'));
    }

    public function adminDetail($id)
    {
        $transactions = Transaction::where('id', $id)->get();
        return view('transactions.detail', compact('transactions', 'id'));
    }

    public function adminApprove($id)
    {
        Transaction::where('id', $id)
                ->update([
                    'status' => 'verified'
                ]);

        $transaction_detail = Transaction_Detail::where('transaction_id', $id)->get();

        foreach ($transaction_detail as $detail) {
            $product = Product::where('id', $detail->product_id)->first();
            Product::where('id', $detail->product_id)
                ->update([
                    'stock' => $product->stock - $detail->qty
            ]);
        }
        return redirect('/transactions');
    }

    public function adminDelivered($id)
    {
        Transaction::where('id', $id)
                ->update([
                    'status' => 'delivered'
                ]);
        return redirect('/transactions');
    }

    public function adminCanceled($id)
    {
        Transaction::where('id', $id)
                ->update([
                    'status' => 'canceled'
                ]);
        return redirect('/transactions');
    }

    public function adminExpired($id)
    {
        Transaction::where('id', $id)
                ->update([
                    'status' => 'expired'
                ]);
        return redirect('/transactions');
    }

    public function transactionsTimeout($id)
    {
        Transaction::where('id', $id)
                ->update([
                    'status' => 'expired'
                ]);
        return redirect('order/expired');
    }

    public function userSuccess($id)
    {
        Transaction::where('id', $id)
                ->update([
                    'status' => 'success'
                ]);
        return redirect('order/success');
    }

    public function userCanceled($id)
    {
        Transaction::where('id', $id)
                ->update([
                    'status' => 'canceled'
                ]);
        return redirect('/order/canceled');
    }

    public function viewPayment($id)
    {
        $products = Product::get();
        $datacart  =  Cart::where('user_id', Auth::guard('user')->user()->id)->get();
        $transaction = Transaction::where(['user_id' => Auth::guard('user')->user()->id, 'id' => $id])->first();
        $total_price = $this->gettotalprice();
        $categories = ProductCategories::all();
        return view('pages.payment',compact('products','datacart','transaction', 'total_price', 'categories'));
    }
    
    public function confirm()
    {
        $checkout = session('checkout');
        $product = $checkout['product_id'];
        $cart = Cart::with('product')->where('user_id', $checkout['user_id'])->where('product_id', $product)->where('status', 'notyet')->get();
        return view('checkout.confirm');
    }


    public function getCities($id)
    {
        $city = City::where('province_id', $id)->pluck('title', 'city_id');
        return json_encode($city);
    }

    /**
        * Show the form for creating a new resource.
        *
        * @return \Illuminate\Http\Response
    */


    public function getCost(Request $request) {
        /*$product = $request->product_id;
        $totalDiscount = 0;
        foreach ($product as $product_id) {
            $discount = Discount::where('id_product', $product_id)->get();
            foreach($discount as $discounts) {
                $totalDiscount += $discounts->percentage;
            }
            dd($totalDiscount);
        }*/

        $url = 'https://api.rajaongkir.com/starter/cost';
        $client = new Client();
        
        $messages = [
            'not_in' => ':attribute belum dipilih!',
            'required' => ':attribute belum diisi!',
            'min' => ':attribute minimal :min karakter!',
            'numeric' => ':attribute hanya angka!',
        ];

        $request->validate([
            'product_id' => 'required',
            'nama_lengkap' => 'min:5',
            'no_hp' => 'numeric|min:10',
            'alamat' => 'required',
            'province' => 'not_in:0',
            'city' => 'not_in:0',
            'courier' => 'not_in:0',
            'payment' => 'not_in:0',
        ], $messages);

        $courier_name = Courier::where('id', $request->courier)->first('courier');
        $getRegency = City::where('city_id', $request->city)->first('title');
        $getProvince = Province::where('province_id', $request->province)->first('title');

        $getCost = $client->request('POST', $url, 
        [
            'headers' => [
                'key' => 'c4267eb2dc0020aee5262bc61cdb044b',
                'Content-Type' => 'application/x-www-form-urlencoded',
            ],
            'form_params' => [
                'origin' => 114,
                'destination' => $request->city,
                'weight' => $request->weight,
                'courier' => strtolower($courier_name->courier),
            ]
        ]);

        $transaction = $request->all();
        $cost = json_decode($getCost->getBody(), true);
        $date = Carbon::now('Asia/Makassar');
        
        $timeout = $date->addHours(24);
        $address = $request->alamat;
        $regency = $getRegency->title;
        $province = $getProvince->title;
        $shipping_cost = $cost['rajaongkir']['results'][0]['costs'][0]['cost'][0]['value'];
        $etd = $cost['rajaongkir']['results'][0]['costs'][0]['cost'][0]['etd'];
        $total = $request->subtotal + $shipping_cost;
        $sub_total = $request->subtotal;
        $user_id = Auth::id();
        $courier_id = $request->courier;
        
        $transaksi = Transaction::create([
            'timeout' => $timeout,
            'address' => $address,
            'regency' => $regency,
            'province' => $province,
            'total' => $total,
            'shipping_cost' => $shipping_cost,
            'sub_total' => $sub_total,
            'user_id' => $user_id,
            'courier_id' => $courier_id,
            'created_at' => $date,
            'status' => 'unverified'
        ]);
        
        $transaksi_id = $transaksi->id;
        $product = $request->product_id;
        
        foreach ($product as $product_id) {
            $user_id = Auth::id();
            $totalDiscount = 0;
            $getProduct = Product::where('id', $product_id)->first();
            $cart = Cart::with('product')->where('product_id', $product_id)->where('status', 'notyet')->first();
            $discount = Discount::where('id_product', $product_id)->get();
            foreach($discount as $discounts) {
                $totalDiscount += $discounts->percentage;
            }
            Transaction_Detail::create([
                'transaction_id' => $transaksi_id,
                'product_id' => $product_id,
                'qty' => $cart->qty,
                'discount' => $totalDiscount,
                'selling_price' => $cart->product->price
            ]);
            Cart::where('product_id', $product_id)->where('user_id', $user_id)->where('status', 'notyet')
                ->update([
                    'status' => 'checkedout'
                ]);
        }
        return redirect('order');
    }

    /**
        * Store a newly created resource in storage.
        *
        * @param \Illuminate\Http\Request $request
        * @return \Illuminate\Http\Response
    */

    public function orderAll()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.index', compact('transaction'));
    }

    public function orderUnpaid()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->where('status', 'unverified')->where('proof_of_payment', NULL)->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.unpaid', compact('transaction'));
    }

    public function orderUnverified()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->where('status', 'unverified')->whereNotNull('proof_of_payment')->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.unverified', compact('transaction'));
    }

    public function orderVerified()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->where('status', 'verified')->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.verified', compact('transaction'));
    }

    public function orderDelivered()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->where('status', 'delivered')->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.delivered', compact('transaction'));
    }

    public function orderSuccess()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->where('status', 'success')->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.success', compact('transaction'));
    }

    public function orderExpired()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->where('status', 'expired')->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.expired', compact('transaction'));
    }

    public function orderCanceled()
    {
        $user_id = Auth::id();
        $transaction = Transaction::with('user')->with('courier')->where('user_id', $user_id)->where('status', 'canceled')->orderBy('created_at', 'DESC')->get();
        //$transaction_detail = Transaction_Detail::with('transaction')->with('product')->where('transaction_id', $transaction->id)->get();
        return view('order.canceled', compact('transaction'));
    }

    public function storeBukti(Request $request)
    {
        $messages = [
            'required' => 'Bukti pembayaran belum diupload!',
            'image' => 'Upload hanya gambar bukti pembayaran!',
            'max' => 'Batas ukuran gambar hanya :max MB',
            'mimes' => 'Upload file sesuai ekstensi :mimes'

        ];

        $request->validate([
            'payment' => 'required|image|mimes:jpeg,png,jpg|max:2048',
        ], $messages);
        
        //$imageName = time().'_.'.$request->payment->extension();
        //$request->payment->move(public_path('payment/'), $imageName);
        $imageName = Storage::putFile('public_html/payment',$request->payment);

        Transaction::where('id', $request->transaction_id)
                ->update([
                    'proof_of_payment' => basename($imageName)
                ]);

    return redirect('order')->with("success", "Bukti pembayaran berhasil diupload!");
        /*if (file_exists('payment/'.$imageName)) {
            return redirect('order')->with("success", "Bukti pembayaran berhasil diupload!");
        } else {
            return redirect('home')->with("failed", "Upload ulang bukti pembayaran!");
        }*/
    }
    

    public function store(Request $request)
    {
        /*$origin = 114;
        $destination =$request->destination;
        $weight = 1000;
        $courier_id = $request->courier;
        $courier_name = Courier::where('id',$courier_id)->first('courier');
        $province_name = Province::where('id',$request->province_to)->first('province');
        $regency_name = City::where('id',$destination)->first('city_name');

        if(Auth::guard('user')->check()){
            $ongkir = Http::asForm()->withHeaders(['key'=>'f9941f3ab651b045b7b3c32e83edc255'])->post('https://api.rajaongkir.com/starter/cost',[
                'origin'=> $origin,
                'destination'=> $destination,
                'weight'=> $weight,
                'courier'=> $courier_name->courier
            ]);

            $cekongkir = $ongkir['rajaongkir']['results'][0]['costs'];

            foreach ($cekongkir as $hasil) {
                $kirim = $hasil['cost'][0]['value'];
            };

            $total = $request->price * $request->qty;
            $sub_total = $total + $kirim;
            $id_user = Auth::guard('user')->id();
            $date = Carbon::now('Asia/Makassar');
            $timeout = $date->addHours(24);
            // echo $date;
            $transaksi = Transaction::create([
                'address' => $request->address,
                'user_id' => $id_user,
                'regency' => $regency_name->city_name,
                'province' => $province_name->province,
                'total' => $total,
                'shipping_cost' => $kirim,
                'sub_total' => $sub_total,
                'courier_id' => $courier_id,
                'timeout' => $timeout,
                'status' => 'unverified'
            ]);

            $transaksi_id = $transaksi->id;
            // echo $transaksi_id;
            // $transaction = Transaction::where('user_id',$id_user)->get();
            // foreach ($transaction as $transactions) {
            // $transaction_id = $transactions->id;
            // } 

            Transaction_Detail::create([
                'transaction_id' => $transaksi_id,
                'product_id' => $request->product_id,
                'qty' => $request->qty,
                'selling_price' => $request->price
            ]);

            $admins = Admin::all();

            foreach ($admins as $admin) {
                $admin->notify(new NewTransaction());
            }

            return redirect('/pesananuser');
        }else{
            return redirect('/userLogin');
        }*/
    }

    public function destroy(Transaction $transaction)
    {
        /*$transaction_id = $transaction->id;
        // dd($transaction_id);
        $transDetail = Transaction_Detail::where('transaction_id',$transaction_id)->get();
        // echo $transDetail->id;
        foreach ($transDetail as $detail) {
            // echo($detail->id); 
            Transaction_Detail::destroy($detail->id);
        }

        Transaction::where('id', $transaction_id)
            ->update([
                'status' => 'canceled'
            ]);

        return redirect('/pesananuser');*/
    }
}
