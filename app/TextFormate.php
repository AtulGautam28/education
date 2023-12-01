<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TextFormate extends Model
{
    use HasFactory;
    protected $fillable=[
        'title','image','description','status'
    ];
}
