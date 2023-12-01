<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dashboardslider extends Model
{
    use HasFactory;
    protected $fillable=[
        'title','image','status'
    ];
    
    public function user(){
        return $this->hasMany(User::class);
    }
}
