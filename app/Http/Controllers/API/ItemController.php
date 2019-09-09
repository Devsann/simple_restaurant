<?php

namespace App\Http\Controllers\API;

use App\Model\Item;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ItemRequest;
use App\Http\Resources\ItemResource;
use Symfony\Component\HttpFoundation\Response;


class ItemController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $this->authorize('isAdmin');
        return ItemResource::collection(Item::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ItemRequest $request)
    {

        $user = auth('api')->user();

        $currentPhoto = $user->photo;
        if ($request->photo != $currentPhoto) {
            $name = time().'.' . explode('/',explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];

            \Image::make($request->photo)->save(public_path('/img/item/').$name);
            $request->merge(['photo' => $name]);

            $userPhoto = public_path('/img/item/').$currentPhoto;
            if (file_exists($userPhoto)) {
                @unlink($userPhoto);
            }
        }
        
        return Item::create([
            'name' => $request['name'],
            'itemSlug'=> str_slug($request['name']),
            'description' => $request['description'],
            'price' => $request['price'],
            'image' => $request['photo'],
            'category_id' => $request['category_id'],
        ]);

        return response()->json();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Item $item)
    {
        return new ItemResource($item);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $item = Item::findOrFail($id);
        
        $currentPhoto = $item->photo;
        if ($request->photo != $currentPhoto) {
            $name = time().'.' . explode('/',explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];

            \Image::make($request->photo)->save(public_path('/img/item/').$name);
            $request->merge(['photo' => $name]);

            $itemPhoto = public_path('/img/item/').$currentPhoto;
            if (file_exists($itemPhoto)) {
                @unlink($itemPhoto);
            }
        }
        $item->update($request->all());
        
        return ['message' => 'Updated Success'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authorize('isAdmin');
        
        $item = Item::findOrFail($id);
        $item->delete();
        return response(null, Response::HTTP_NO_CONTENT);        
    }
}
