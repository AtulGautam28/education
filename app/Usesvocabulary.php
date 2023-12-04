<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usesvocabulary extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id','vocabulary_id'
    ];
}
