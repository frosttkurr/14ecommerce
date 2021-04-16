<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $dates = ['created_at'];
    protected $fillable = ['timeout','address',"regency","province","total","shipping_cost","sub_total","user_id","courier_id","proof_of_payment","status"];
    
    public function transaction_detail()
    {
        return $this->hasMany('App\Transaction_Detail');
    }
    
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    
    public function courier()
    {
        return $this->belongsTo('App\Courier');
    }
}
