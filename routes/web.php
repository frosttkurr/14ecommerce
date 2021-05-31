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
//review
Route::prefix('product')->group(function () {
    Route::get('/{id}', 'HomeController@detail_product')->name('detail_product');
    Route::post('review/{id}', 'HomeController@review_product')->name('review_product');
});

/*Route::get('/productuser', function() {
    return view('user.productuser');
});*/

Route::prefix('admin')->group(function(){
    Route::get('/', 'AdminController@index')->name('admin.dashboard');
    Route::get('/login', 'Auth\AdminLoginController@showLoginform')->name('admin.login');
    Route::post('/login', 'Auth\AdminLoginController@login')->name('admin.login.submit');
    Route::get('/', 'AdminController@index')->name('admin.dashboard')->middleware('auth:admin');
    Route::get('/logout', 'Auth\AdminLoginController@logout')->name('admin.logout');
    Route::get('/register', 'Auth\AdminRegisterController@showRegistrationForm')->name('admin.register');
    Route::post('/register','Auth\AdminRegisterController@register')->name('admin.register.submit');

    Route::get('/password/reset','Auth\AdminForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
    Route::post('/password/email','Auth\AdminForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
    Route::get('/password/reset{token}','Auth\AdminResetPasswordController@showResetForm')->name('admin.password.reset');
    Route::post('/password/reset','Auth\AdminResetPasswordController@reset')->name('admin.password.update');
});

//Courier
Route::resource('/courier','CourierController')->middleware('auth:admin');

//Product
Route::resource('/products','ProductController')->middleware('auth:admin');
Route::post('/{id}/edit', 'ProductController@edit')->name('product.edit')->middleware('auth:admin');
Route::post('/{id}/update', 'ProductController@update')->name('product.update')->middleware('auth:admin');
Route::post('/{id}/add_image', 'ProductController@add_image')->name('product.add_image')->middleware('auth:admin');
Route::delete('/{id}/delete_image', 'ProductController@delete_image')->name('product.delete_image')->middleware('auth:admin');
Route::post('/{id}/add_cat', 'ProductController@add_cat')->name('product.add_cat')->middleware('auth:admin');
Route::delete('/{id}/delete_cat', 'ProductController@delete_cat')->name('product.delete_cat')->middleware('auth:admin');

//Categories
Route::resource('/categories','ProductCategoriesController')->middleware('auth:admin');

Route::prefix('admin/response')->group(function () {
    Route::get('/', 'ResponseController@index')->name('admin.response')->middleware('auth:admin');
    Route::get('/add', 'ResponseController@create')->name('response.add')->middleware('auth:admin');
    Route::get('/{review}/add', 'ResponseController@add_response')->name('response.add_response')->middleware('auth:admin');
    Route::get('/{response}/edit', 'ResponseController@edit')->name('response.edit')->middleware('auth:admin');
    Route::post('/store', 'ResponseController@store')->name('response.store')->middleware('auth:admin');
    Route::put('/{id}/update', 'ResponseController@update')->name('response.update')->middleware('auth:admin');
    Route::delete('/{id}', 'ResponseController@destroy')->name('response.destroy')->middleware('auth:admin');
});

Route::prefix('admin/discount')->group(function () {
    Route::get('/', 'DiscountController@index')->name('admin.discount')->middleware('auth:admin');
    Route::get('/add/{id}', 'DiscountController@create')->name('discount.add')->middleware('auth:admin');
    Route::get('/{discount}/edit', 'DiscountController@edit')->name('discount.edit')->middleware('auth:admin');
    Route::post('/store', 'DiscountController@store')->name('discount.store')->middleware('auth:admin');
    Route::put('/{id}/update', 'DiscountController@update')->name('discount.update')->middleware('auth:admin');
    Route::delete('/{id}', 'DiscountController@destroy')->name('discount.destroy')->middleware('auth:admin');
});

//Admin Transactions
Route::get('/transactions', 'TransactionsController@adminIndex')->name('transactions')->middleware('auth:admin');
Route::get('/transactions/detail/{id}', 'TransactionsController@adminDetail')->name('transactions.detail')->middleware('auth:admin');
Route::put('/approve/{id}', 'TransactionsController@adminApprove')->name('transactions.approve')->middleware('auth:admin');
Route::put('/delivered/{id}', 'TransactionsController@adminDelivered')->name('transactions.delivered')->middleware('auth:admin');
Route::put('/canceled/{id}', 'TransactionsController@adminCanceled')->name('transactions.canceled')->middleware('auth:admin');
Route::put('/expired/{id}', 'TransactionsController@adminExpired')->name('transactions.expired')->middleware('auth:admin');
Route::put('/success/{id}', 'TransactionsController@userSuccess')->name('user.success')->middleware('auth');
Route::put('/userCanceled/{id}', 'TransactionsController@userCanceled')->name('user.canceled')->middleware('auth');
Route::put('/timeout/{id}', 'TransactionsController@transactionsTimeout')->name('transactions.timeout');

//Checkout
Route::get('/cart', 'CartsController@index')->name('checkout.cart')->middleware('auth');
Route::post('/cart', 'CartsController@store')->name('cart.add')->middleware('auth');
Route::get('/cart/{product_id}', 'CartsController@destroy')->name('cart.delete')->middleware('auth');
Route::post('/checkout', 'CartsController@checkout')->name('cart.checkout')->middleware('auth');
Route::get('/checkout', 'TransactionsController@index')->name('cart.index')->middleware('auth');
Route::get('/province/{id}/cities', 'TransactionsController@getCities');
Route::post('/checkout/detail', 'TransactionsController@getCost')->name('checkout.detail')->middleware('auth');

//Order
Route::get('/order', 'TransactionsController@orderAll')->name('order.all')->middleware('auth');
Route::post('/order', 'TransactionsController@storeBukti')->name('order.payment')->middleware('auth');
Route::get('/order/unpaid', 'TransactionsController@orderUnpaid')->name('order.unpaid')->middleware('auth');
Route::get('/order/unverified', 'TransactionsController@orderUnverified')->name('order.unverified')->middleware('auth');
Route::get('/order/verified', 'TransactionsController@orderVerified')->name('order.verified')->middleware('auth');
Route::get('/order/delivered', 'TransactionsController@orderDelivered')->name('order.delivered')->middleware('auth');
Route::get('/order/success', 'TransactionsController@orderSuccess')->name('order.success')->middleware('auth');
Route::get('/order/expired', 'TransactionsController@orderExpired')->name('order.expired')->middleware('auth');
Route::get('/order/canceled', 'TransactionsController@orderCanceled')->name('order.canceled')->middleware('auth');

//Notification
Route::get('user/{id}', 'HomeController@userNotif')->name('user.notification')->middleware('auth');
Route::get('admin/{id}', 'AdminController@adminNotif')->name('admin.notification')->middleware('auth:admin');