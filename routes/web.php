<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes(['verify' =>true]);

Route::get('/home', 'HomeController@index')->name('home');
Route::prefix('product')->group(function () {
    Route::get('/{id}', 'HomeController@detail_product')->name('detail_product');
    Route::post('review/{id}', 'HomeController@review_product')->name('review_product');
});
Route::get('/productuser', function() {
    return view('user.productuser');
});

Route::prefix('admin')->group(function(){
    Route::get('/', 'AdminController@index')->name('admin.dashboard');
    Route::get('/login', 'Auth\AdminLoginController@showLoginform')->name('admin.login');
    Route::post('/login', 'Auth\AdminLoginController@login')->name('admin.login.submit');
    Route::get('/', 'AdminController@index')->name('admin.dashboard')->middleware('auth:admin');
    Route::post('/logout', 'Auth\AdminLoginController@logout')->name('admin.logout');
    Route::get('/register', 'Auth\AdminRegisterController@showRegistrationForm')->name('admin.register');
    Route::post('/register','Auth\AdminRegisterController@register')->name('admin.register.submit');

    Route::get('/password/reset','Auth\AdminForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
    Route::post('/password/email','Auth\AdminForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
    Route::get('/password/reset{token}','Auth\AdminResetPasswordController@showResetForm')->name('admin.password.reset');
    Route::post('/password/reset','Auth\AdminResetPasswordController@reset')->name('admin.password.update');
});

//Courier
Route::resource('/courier','CourierController');

//Product
Route::resource('/products','ProductController');
Route::get('/{id}/edit', 'ProductController@edit')->name('product.edit');
Route::post('/{id}/add_image', 'ProductController@add_image')->name('product.add_image');
Route::delete('/{id}/delete_image', 'ProductController@delete_image')->name('product.delete_image');
Route::post('/{id}/add_cat', 'ProductController@add_cat')->name('product.add_cat');
Route::delete('/{id}/delete_cat', 'ProductController@delete_cat')->name('product.delete_cat');

//Categories
Route::resource('/categories','ProductCategoriesController');

Route::prefix('admin/response')->group(function () {
    Route::get('/', 'ResponseController@index')->name('admin.response');
    Route::get('/add', 'ResponseController@create')->name('response.add');
    Route::get('/{review}/add', 'ResponseController@add_response')->name('response.add_response');
    Route::get('/{response}/edit', 'ResponseController@edit')->name('response.edit');
    Route::post('/store', 'ResponseController@store')->name('response.store');
    Route::put('/{id}/update', 'ResponseController@update')->name('response.update');
    Route::delete('/{id}', 'ResponseController@destroy')->name('response.destroy');
});

Route::prefix('admin/discount')->group(function () {
    Route::get('/', 'DiscountController@index')->name('admin.discount');
    Route::get('/add/{id}', 'DiscountController@create')->name('discount.add');
    Route::get('/{discount}/edit', 'DiscountController@edit')->name('discount.edit');
    Route::post('/store', 'DiscountController@store')->name('discount.store');
    Route::put('/{id}/update', 'DiscountController@update')->name('discount.update');
    Route::delete('/{id}', 'DiscountController@destroy')->name('discount.destroy');
});