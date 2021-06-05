<?php

namespace App\Http\Controllers;

use App\Response ;
use App\Product_Review;
use App\Admin;
use App\User;
use Auth as Auth;
use Illuminate\Auth\SessionGuard;
use Illuminate\Http\Request;

class ResponseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        //
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

    public function add_response($review)
    {
        $response = Response::where('review_id','=',$review)->get();
        if (!$response->isEmpty()) {
            // dd($response);
           return redirect()->intended(route('response.edit',['response'=>$response[0]]));
        }
        $product_review = Product_Review::where('id','=',$review)->with('user','product')->get();
        $admin = \Auth::user();
     
        //$admin_id=1;
        return view('response.response',compact('product_review','admin'));
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
            'content' => ['required'],
        ]);

        $response = new Response();
        $response->review_id = $request->review_id;
        $response->admin_id = $request->admin_id;
        $response->content = $request->content;

        $review = Product_Review::find($request->review_id);
        $user = User::find($review->user_id);

        if ($response->save()) {
            //Notif Admin
            $admin = Admin::find(10);
            $data = [
                'nama'=> 'Admin',
                'message'=>'Response dikirim!',
                'id'=> $review->product_id,
                'category' => 'review'
            ];
            $data_encode = json_encode($data);
            $admin->createNotif($data_encode);

            //Notif User
            $data = [
                'nama'=> $user->name,
                'message'=>'Review diresponse!',
                'id'=> $review->product_id,
                'category' => 'review'
            ];
            $data_encode = json_encode($data);
            $user->createNotifUser($data_encode);
            return redirect("/products");
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $response = Response::find($id);
        $product_review = Product_Review::where('id', '=', $response->review_id)->with('user', 'product')->get();
        $admin = \Auth::user();
        $content = $response->content;
        return view('response.editresponse', compact('product_review', 'admin','response','content'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'content' => ['required'],
        ]);

        $response=new Response();
        $response=Response::find($id);
        $response->review_id = $request->review_id;
        $response->admin_id = $request->admin_id;
        $response->content = $request->content;
        $response->save(); 
        return redirect("/products");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
