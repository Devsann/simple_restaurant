<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReserveResource extends JsonResource
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
            'email' => $this->email,
            'message'=> $this->message,
            'status' => $this->status,
            'phone' => $this->phone,
            'created_at' => $this->created_at->format('d/m/Y'),
        //   'created_at' => $this->created_at->diffForHumans(),
        ];
    }
}
