<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Reserve extends Model
{
    protected $fillable = [
        'name','email','phone','message'
     ];
}
