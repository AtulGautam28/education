<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Practice extends Model
{
    use HasFactory;
    protected $fillable=[
        'title','description','instructions','slug','status','subject_id'
    ];

    public function segments(){
        return $this->hasMany(Segments::class);
    }
    public function segment(){
        return $this->belongsTo(Practice::class);
    }
}
