<?php

namespace App\Http\Controllers\API;

use App\Model\Reserve;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ReserveRequest;
use App\Http\Resources\ReserveResource;
use Symfony\Component\HttpFoundation\Response;


class ReserveController extends Controller
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
        return ReserveResource::collection(Reserve::latest()->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ReserveRequest $request)
    {

        return Reserve::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'phone' => $request['phone'],
            'message' => $request['message'],
            'status'=>false,

        ]);

        return response()->json();
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Reserve $reserve)
    {
        return new ReserveResource($reserve);
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
        //
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
        
        $reserve = Reserve::findOrFail($id);
        $reserve->delete();
        return response(null, Response::HTTP_NO_CONTENT);
    }

    public function status($id)
    {
        $reserve = Reserve::find($id);
        $reserve->status = true;
        $reserve->save();

        return ['message' => 'Updated Success'];
    }
}
