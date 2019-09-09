<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'name','catSlug'
     ];

     public function getRouteKeyName()
    {
        return 'catSlug';
    }

    public function getPathAttribute()
    {
        return "/category/$this->catSlug";
    }

    public function items()
    {
        // return $this->hasMany('App\Model\Item');
        return $this->hasMany(Item::class,'category_id');
    }

}
