<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Disc;

class PostController extends Controller
{    
    public function execute(){	

	    if(view()->exists('admin.admin')) {

            $discs= Disc::all();	
            return view('admin.admin',['discs'=>$discs]);           

        } 
	    	else{
	    		abort(404);
	    }
	}
}
