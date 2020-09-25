<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Disc;
//use Auth;

use Gate;

class DeletePostController extends Controller
{
   /* public function show()
	{
		$discs= Disc::all();				
	    return view('admin.admin', ['discs'=>$discs]);
	}
*/
    public function destroy($id) {

	   $disc= Disc::find($id);
    	
	    if ($disc) {
               
            if(Gate::allows('delete', $disc)){        
                
                $disc->delete();       
                return redirect()->route('edit_post')->with(['message'=> 'Пластина удалена']);                    

            } return redirect()->back()->with(['message'=>'У вас нет прав!']);       

        } else  return redirect()->route('edit_post')->with(['message'=> 'Нет такой пластины!!']);
  	}
}
