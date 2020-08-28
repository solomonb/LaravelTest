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


Route::get('/', 'DiscController@index');
Route::get('disc/all', 'DiscController@index');

Auth::routes();

Route::group(['middleware'=>'web'], function (){
	Route::auth();
});

Route::group(['prefix'=>'admin','middleware'=>['web','auth']], function() {
	
	Route::get('/add/post', ['uses'=>'Admin\AdminPostController@show','as'=>'admin_add_post']);
	Route::post('/add/post', ['uses'=>'Admin\AdminPostController@create','as'=>'admin_add_post_p']);
	
	Route::get('/edit/update/post/{id}', ['uses'=>'Admin\AdminUpdatePostController@show','as'=>'admin_update_post']);
	Route::post('/update/post', ['uses'=>'Admin\AdminUpdatePostController@create','as'=>'admin_update_post_p']);

	Route::get('/edit/post', ['uses'=>'Admin\AdminDeletePostController@show','as'=>'admin_edit_post']);
	Route::get('/edit/delete/post/{id}', ['uses'=>'Admin\AdminDeletePostController@destroy','as'=>'admin_delete_post_d']);
});
