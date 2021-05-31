<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Product_Image;
use App\Product_Review;
use App\Response;
use App\Admin;
use App\User;
use App\Transaction;
use Carbon\Carbon;
use App\AdminNotifications;
use App\UserNotifications;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth', 'verified']);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $product = Product::paginate(9);
        return view('home',compact('product'));
    }

    function detail_product($id)
    {
        $product = Product::find($id);
        $product_images = Product_Image::where('product_id','=',$product->id)->get();
        $product_reviews = Product_Review::where('product_id', '=', $product->id)->with('user')->paginate(5);
        $user = Auth::user();
        $user_review = Product_Review::where('product_id', '=', $product->id)->where('user_id', '=', $user->id)->with('user')->first();
        $transaction = Transaction::where('user_id', $user->id)->where('status', 'success')->get();
        return view('user.productuser',compact('product', 'product_images', 'product_reviews','user','user_review','transaction'));
    }

    public function review_product($id, Request $request)
    {
        $request->validate([
            'rate' => ['required'],
            'content' => ['required', 'max:100']
        ]);

        $user = Auth::user();
        $review = new Product_Review();
        $review->product_id = $id;
        $review->user_id = $user->id;
        $review->rate = $request->rate;
        $review->content = $request->content;
        if($review->save()){
            $product = Product::find($id);
            $avg_rate = DB::select('SELECT AVG(rate) as avg_rate FROM product_reviews WHERE product_id=?', [$id]);
            $avg_rate = json_decode(json_encode($avg_rate), true);
            $product->product_rate = (int)round($avg_rate[0]["avg_rate"]);
            $product->save();

            $admin = Admin::find(2);
            $details = [
                'order' => 'Review',
                'body' => 'User has review our Product!',
                'link' => url(route('product.edit',['id'=> $id])),
            ];

            //Notif Admin
            $admin = Admin::find(10);
            $data = [
                'nama'=> $user->name,
                'message'=>'mereview product!',
                'id'=> $id,
                'category' => 'review'
            ];
            $data_encode = json_encode($data);
            $admin->createNotif($data_encode);

            //Notif User
            $data = [
                'nama'=> $user->name,
                'message'=>'Review dikirimkan!',
                'id'=> $id,
                'category' => 'review'
            ];
            $data_encode = json_encode($data);
            $user->createNotifUser($data_encode);

            return redirect()->back()->with("Success", "Successfully Comment");
        }
        return redirect()->back()->with("error", "Failed Comment");
    }

    public function userNotif($id) 
    {
        $notification = UserNotifications::find($id);
        $notif = json_decode($notification->data);
        $date = Carbon::now('Asia/Makassar');
        UserNotifications::where('id', $id)
                ->update([
                    'read_at' => $date
                ]);
        
        if ($notif->category == 'transaction') {
            return redirect()->route('order.all');
        } elseif ($notif->category == 'approved') {
            return redirect()->route('order.verified');
        } elseif ($notif->category == 'delivered') {
            return redirect()->route('order.delivered');
        } elseif ($notif->category == 'canceled') {
            return redirect()->route('order.canceled');
        } elseif ($notif->category == 'expired') {
            return redirect()->route('order.expired');
        } elseif ($notif->category == 'success') {
            return redirect()->route('order.success');
        } elseif ($notif->category == 'review') {
            return redirect()->route('detail_product', $notif->id);
        }
    }
}
