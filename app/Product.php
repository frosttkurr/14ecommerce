<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table='products';

    public function relasi_product_image(){
        return $this->hasMany('App\Product_image','product_id','id');
    }
}
