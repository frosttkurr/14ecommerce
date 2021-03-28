<?php

namespace App\Http\Controllers;

use App\Product;
use App\Product_Categories;
use App\Product_Category_Details;
use App\Product_Image;
use App\Discount;
use App\Product_Review;
use App\Response;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use File;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Product::all();
        return view('product.product',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {  
        $request->validate([
            'product_images' => ['required'],
            'product_images.*' => [ 'mimes:jpg,jpeg,png', 'max:2000'],
            'product_name' => ['required','max:100'],
            'price' => ['required', 'regex:/^\d+(\.\d{1,2})?$/'],
            'description' => ['required'],
            'product_rate' => ['required','max:100'],
            'stock' => ['required', 'max:10'],
            'weight' => ['required', 'max:3'],

        ]);

        if($request->hasFile('product_images')){

            $product = new Product;
            $product->product_name = $request->product_name;
            $product->price = $request->price;
            $product->description = $request->description;
            $product->product_rate = $request->product_rate;
            $product->stock = $request->stock;
            $product->weight = $request->weight;
            $product->save();


            $product = DB::table('products')->where('product_name','=', $request->product_name)->first();
            foreach($request->file('product_images') as $file){
                $name = rand(1000,9999) . '_.' . $file->extension();
                $file->move("product_images/", $name);
                $image = new Product_Image();
                $image->product_id= $product->id;
                $image->image_name=$name;
                $image->save();
            }
            return redirect("/products");
        }

       return redirect()->back()->withInput($request->only('product_name', 'price', 'description', 'product_rate', 'stock', 'weight'))->with('error', 'Please fill in all fields with valid value');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

}



