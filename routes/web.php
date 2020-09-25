<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/


Route::get('/', ['uses'=>'DiscController@index', 'as'=>'home']);



//Auth::routes();

Route::group(['middleware'=>'web'], function (){
	Route::auth();	
	
	Route::match(['get','post'],'/add/post', ['uses'=>'AddPostController@create','as'=>'add_post']);
	
	Route::group(['prefix'=>'admin','middleware'=>'auth'], function() {
	
		Route::group(['prefix'=>'edit'], function() {
			Route::get('/post',['uses'=>'Admin\PostController@execute','as'=>'edit_post']);				
			
			Route::get('/update/post/{id}', ['uses'=>'Admin\EditPostController@show','as'=>'admin_update_post']);
			Route::post('/update/post', ['uses'=>'Admin\EditPostController@create','as'=>'admin_update_post_p']);

			Route::get('/delete/post/{id}', ['uses'=>'Admin\DeletePostController@destroy','as'=>'delete_post']);
		});		
	});

});


