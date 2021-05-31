<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\AdminNotifications;
use App\UserNotifications;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('admin.admindashboard');
    }

    public function adminNotif($id) 
    {
        $notification = AdminNotifications::find($id);
        $notif = json_decode($notification->data);
        $date = Carbon::now('Asia/Makassar');
        AdminNotifications::where('id', $id)
                ->update([
                    'read_at' => $date
                ]);
        
        if ($notif->category = 'transaction') {
            return redirect()->route('transactions.detail', $notif->id);
        } elseif ($notif->category = 'review') {
            return redirect()->route('product.edit', $notif->id);
        } 
    }
}
