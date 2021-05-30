<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class NotifController extends Controller
{
    public function getNotif(Request $request){
        if(Auth::guard('user')->check()){
            if ($request->read_at == null){
                Auth::guard('user')->user()->unreadNotifications->where('id', $request->id_ntf)->markAsRead();
                if ($request->type == "App\Notifications\AdminResponse"){
                    $notif = 1;
                } elseif ($request->type == "App\Notifications\UpdateStatus") {
                    $notif = 2;
                }
            } else {
                if ($request->type == "App\Notifications\AdminResponse"){
                    $notif = 1;
                } else if ($request->type == "App\Notifications\UpdateStatus") {
                    $notif = 2;
                }
            }
        } elseif (Auth::guard('admin')->check()){
            if ($request->read_at == null){
                Auth::guard('admin')->user()->unreadNotifications->where('id', $request->id_ntf)->markAsRead();
                if ($request->type == "App\Notifications\NewReview"){
                    $notif = 1;
                } elseif ($request->type == "App\Notifications\NewTransaction") {
                    $notif = 2;
                } elseif ($request->type == "App\Notifications\UploadProof") {
                    $notif = 3;
                }
            } else {
                if ($request->type == "App\Notifications\NewReview"){
                    $notif = 1;
                } elseif ($request->type == "App\Notifications\NewTransaction") {
                    $notif = 2;
                } elseif ($request->type== "App\Notifications\UploadProof") {
                    $notif = 3;
                }
            }
        }
        return json_encode($notif);
    }
}
