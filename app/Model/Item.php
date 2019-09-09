<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $fillable = [
        'name','description','price','image','category_id','itemSlug'
     ];

    public function category()
    {
        // return $this->belongsTo('App\Model\Category');
        return $this->belongsTo(Category::class,'category_id');
    }

    public function getRouteKeyName()
    {
        return 'itemSlug';
    }

    public function getPathAttribute()
    {
        return "/item/$this->itemSlug";
    }
}
