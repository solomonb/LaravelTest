<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Disc;
use Illuminate\Pagination\LengthAwarePaginator;

class DiscController extends Controller
{
    public function index()
		{				
			$discs= Disc::Paginate(7);						
		    return view('disc.all', ['discs'=>$discs]);			    
		}
}
