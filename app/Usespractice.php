<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usespractice extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id','practice_id'
    ];
}
