<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Disc;
use Auth;

use Gate;

class AdminUpdatePostController extends Controller
{
   public function show(Request $request, $id){
       
    	$disc = Disc::find($id);
    	return view('admin.update_post',['disc'=>$disc]);    
    }

    public function create(Request $request){

    	$this->validate($request,[
    		'name'=>'required',
    		'text' => 'required'
    	]);

    	$user = Auth::user();
    	$data = $request->except('_token');

    	$disc = Disc::find($data['id']);
    	
    	if(Gate::allows('update',$disc)){
    		$disc->name = $data['name'];
	    	
	    	$disc->text = $data['text'];

	    	$res = $user->discs()->save($disc);

	    	return redirect()->back()->with('message', 'Данные пластины обновлены');   	
    	}    	

    	return redirect()->back()->with('message', 'У вас нет прав');
    }
}
