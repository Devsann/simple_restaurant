<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ItemResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'itemSlug' => $this->itemSlug,
            'path'=> $this->path,
            'price' => $this->price,
            'description' => $this->description,
            'image' => $this->image,
            'catName' => $this->category->name,
            'catSlug' => $this->category->catSlug,
            'created_at' => $this->created_at->format('d/m/Y'),
        ];
    }
}
