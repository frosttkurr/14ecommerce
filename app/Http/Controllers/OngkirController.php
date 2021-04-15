<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\City;

class OngkirController extends Controller
{
    public function index()
    {
        // dd($request);
        $origin = 114;
        $destination =12;      
        $weight = 1000;      
        $courier = "jne";      
        
        $cost = Http::asForm()->withHeaders([      
            'key'=>'f9941f3ab651b045b7b3c32e83edc255'    
        ])->post('https://api.rajaongkir.com/starter/cost',[
            'origin'=> $origin,
            'destination'=> $destination,
            'weight'=> $weight,
            'courier'=> $courier
        ]);
        
        $cekongkir = $cost['rajaongkir']['results'][0]['costs'];
        dd($cekongkir);
    }    
}
