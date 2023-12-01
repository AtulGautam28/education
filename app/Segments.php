<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Segments extends Model
{
    protected $fillable=[
        'practice_id','question','answer','question_audio','answer_audio','status'
    ];

    public function practice(){
        return $this->belongsTo(Practice::class);
    }
    public function practices(){
        return $this->hasMany(Segments::class);
    }
}
