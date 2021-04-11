<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Cart;
use App\Product;
use App\Courier;
use App\Transaction;
use App\Transaction_Detail;
use App\Province;
use App\City;
use Illuminate\Support\Facades\Http; 
use Illuminate\Support\Facades\Auth; 
use Illuminate\Http\Request;

class CartsController extends Controller
{
    /**
        * Display a listing of the resource.
        *
        * @return \Illuminate\Http\Response
    */

    public function  construct()
    {
        $this->middleware('isUser');
    }

    public function index()
    {
        echo "ini index";
    }

    /**
        * Show the form for creating a new resource.
        *
        * @return \Illuminate\Http\Response
    */
    
    public function create()
    {
        $id_user = Auth::guard('user')->id();
        $products = Product::with('Cart')->get();
        $carts = Cart::where('user_id',$id_user)->get();
        $couriers = Courier::all();
        $provinsi = Province::all();
        
        return view('user.cartuser', compact('carts','products','id_user','couriers','provinsi'));
    }

    /**
        * Store a newly created resource in storage.
        *
        * @param \Illuminate\Http\Request $request
        * @return \Illuminate\Http\Response
    */
    
    public function store(Request $request)
    {
        if(Auth::guard('user')->check()){
            $id_user = Auth::guard('user')->id(); Cart::create([
                'user_id' => $id_user,
                'product_id' => $request->id_product,
                'qty' => $request->qty,
                'status' => 'notyet'
            ]);
            return redirect('/products'); 
        }else{
            return redirect('/userLogin');
        }
    }
    
    /**
        * Display the specified resource.
        *
        * @param \App\Cart $cart
        * @return \Illuminate\Http\Response
    */
    
    public function show(Cart $cart)
    {
        //
    }
    
    /**
        * Show the form for editing the specified resource.
        *
        * @param \App\Cart $cart
        * @return \Illuminate\Http\Response
    */

    public function edit(Cart $cart)
    {
        echo "ini edit";
    }

    /**
        * Update the specified resource in storage.
        *
        * @param \Illuminate\Http\Request $request
        * @param \App\Cart $cart
        * @return \Illuminate\Http\Response
    */

    public function update(Request $request, Cart $cart)
    {
        //
    }

    /**
        * Remove the specified resource from storage.
        *
        * @param \App\Cart $cart
        * @return \Illuminate\Http\Response
    */

    public function destroy(Cart $cart)
    {
        $cart_id = $cart->id;
        // dd($cart_id);
        // Cart::destroy($cart_id); 
        Cart::where('id',$cart_id)->update([
            'status' => 'cancelled'
        ]);
        return redirect('/cartuser');
    }

    public function transaction(Request $request)
    {
        $origin = 114;
        $destination =$request->destination;
        $weight = 1000;
        $courier_id = $request->courier;
        $courier_name = Courier::where('id',$courier_id)->first('courier');
        $province_name = Province::where('id',$request->province_to)->first('province');
        $regency_name = City::where('id',$destination)->first('city_name');
        $ongkir = Http::asForm()->withHeaders([
            'key'=>'f9941f3ab651b045b7b3c32e83edc255'
        ])->post('https://api.rajaongkir.com/starter/cost',[
            'origin'=> $origin,
            'destination'=> $destination,
            'weight'=> $weight,
            'courier'=> $courier_name->courier
        ]);

        $cekongkir = $ongkir['rajaongkir']['results'][0]['costs'];

        foreach ($cekongkir as $hasil) {
            $kirim=$hasil['cost'][0]['value'];
        };

        $id_user = Auth::guard('user')->id();
        $sell = 0;
        $all_cart       =       Cart::where('user_id',$id_user)->Where('status','notyet')->get();

        foreach ($all_cart as $cart) {
            $selling = $cart->qty*$cart->product->price;
            $sell += $selling;
        }

        $sub_total = $sell+$kirim;
        $date = Carbon::now()->addHours(8);
        $timeout = $date->addHours(24);

        $transaksi = Transaction::create([
            'address' => $request->address,
            'user_id' => $id_user,
            'regency' => $regency_name->city_name,
            'province' => $province_name->province,           
            'total' => $sell,           
            'shipping_cost' => $kirim,            
            'sub_total' => $sub_total,            
            'courier_id' => $courier_id,            
            'timeout' => $timeout,           
            'status' => 'unverified'       
        ]);
            
        $transaksi_id = $transaksi->id;
            
        foreach ($all_cart as $carts) { 
            Transaction_Detail::create([
                'transaction_id' => $transaksi_id,
                'product_id' => $carts->product_id,
                'qty' => $carts->qty,
                'selling_price' => $carts->product->price*$carts->qty    
            ]);    
        }
        return redirect('/pesananuser');        
    }
}
