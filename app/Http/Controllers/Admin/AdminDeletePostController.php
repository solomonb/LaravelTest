<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Disc;
//use Auth;

use Gate;

class AdminDeletePostController extends Controller
{
    public function show()
	{
		$discs= Disc::all();				
	    return view('admin.admin', ['discs'=>$discs]);
	}

    public function destroy($id) {

	   $disc= Disc::find($id);
    	
	    if(Gate::allows('delete', $disc)){    	

			if($disc != null){
				$disc->delete();	   
			  	return redirect('admin/edit/post');
		  	} else	return redirect('admin/edit/post')->with(['message'=> 'Нет такой строки!']);

    	}
    	return redirect()->back()->with(['message'=>'У вас нет прав!']);
  	}
}
