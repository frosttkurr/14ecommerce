<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Cart;
use App\Product;
use App\Product_Image;
use App\Courier;
use App\Transaction;
use App\Transaction_Detail;
use Illuminate\Support\Facades\Http; 
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class CartsController extends Controller
{
    /**
        * Display a listing of the resource.
        *
        * @return \Illuminate\Http\Response
    */

    public function __construct()
    {
        $this->middleware(['auth', 'verified']);
    }

    public function index()
    {
        $cart = Cart::with('product')->get();
        return view('checkout.cart',compact('cart'));
    } 

    /**
        * Show the form for creating a new resource.
        *
        * @return \Illuminate\Http\Response
    */
    
    /*public function add_to_cart($id){
        $cart = session('cart');
        $product = Product::find($id);
        $product_image = Product_Image::where('product_id','=',$product->id)->get();
        $cart['id'] = [
            "product" => $product->product_name,
            "price" => $product->price,
            "stock" => $product->stock,
            //"image" => $product_image->image_name,
            "qty" => 1
        ];
        session(['cart' => $cart]);
        return redirect('/cart');
    }*/

    public function create()
    {
        //
    }

    /**
        * Store a newly created resource in storage.
        *
        * @param \Illuminate\Http\Request $request
        * @return \Illuminate\Http\Response
    */
    
    public function store(Request $request)
    {
        $cek = Cart::where('user_id', '=', $request->user_id)
                    ->where('product_id', '=', $request->product_id)
                    ->where('carts.status', '=', 'notyet')->first();
        if (is_null($cek)) {
            DB::table('carts')->insert(
                ['user_id' => $request->user_id,
                'product_id' => $request->product_id,
                'qty' => $request->qty,
                'status' => 'notyet']
            );
            /*$carts = new Cart;
            $carts->product_id = $request->product_id;
            $carts->qty = $request->qty;
            $carts->user_id = $request->user_id;
            $carts->status = "notyet";
            $carts->save();
            $cart_count = DB::table('carts')->where('carts.status', '=', 'notyet')
                ->where('carts.user_id', '=', Auth::user()->id)->count('carts.id');*/
            return redirect('/cart')->with('status', 'Product berhasil ditambah!');
        }else{
            DB::table('carts')
            ->where('product_id', $request->product_id)
            ->update([
                'qty' => $request->qty     
            ]);
            return redirect('/cart')->with('status', 'Product berhasil ditambah!');
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
        //
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
        //
    }

    public function transaction(Request $request)
    {
        //   
    }
}
