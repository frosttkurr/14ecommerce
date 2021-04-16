<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction_Detail extends Model
{
    protected $table = 'transaction_details';
    protected $fillable = ['transaction_id',"product_id","qty","discount","selling_price"];
    
    public function transaction()
    {
        return $this->belongsTo('App\Transaction');
    }
    
    public function product()
    {
        return $this->belongsTo('App\Product');
    }
}
