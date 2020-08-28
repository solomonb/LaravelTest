<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Disc extends Model
{	
   protected $fillable = [
        'name', 'text'
    ];

    public function users() {
        return $this->belongsTo('App\User','user_id');
    }
}
