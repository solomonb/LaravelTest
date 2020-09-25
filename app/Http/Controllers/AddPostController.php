<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\User;
use App\Disc;
use Auth;

use Gate;

class AddPostController extends Controller
{
    public function create(Request $request){

    	if ($request->isMethod('post')) {
    	
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

	        if(view()->exists('disc.add_post')){
	            return redirect()->back()->with('message', 'Пластина добавлена');
	        }
	        else{
	            abort(404);
	        }

    	}

    	if(view()->exists('disc.add_post')) {
    		
    		return view('disc.add_post');
    	}
    	else{
    		abort(404);
    	}
    	
    }
}
