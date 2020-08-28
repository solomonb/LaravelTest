<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\User;
use App\Disc;
use Auth;

use Gate;

class AdminPostController extends Controller
{
    public function show(){
    	return view('admin.add_post');
    }

    public function create(Request $request){

    	$disc = new Disc;

    	if(Gate::denies('add',$disc)){
    		return redirect()->back()->with(['message'=>'У вас нет прав']);
    	}

    	$this->validate($request,[
    		'name'=>'required',
    		'text' => 'required'
    	]);

    	$user = Auth::user();
    	$data = $request->all();

    	$res = $user->discs()->create([
    		'name'=>$data['name'],    	
    		'text'=>$data['text']
    	]);

    	return redirect()->back()->with('message', 'Пластина добавлена');
    }
}
