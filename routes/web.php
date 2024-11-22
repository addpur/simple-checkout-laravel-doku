<?php

use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\TransactionController;
use Illuminate\Support\Facades\Route;

Route::get('/',                           [CheckoutController::class, 'index']);
Route::post('/cart-detail',               [CheckoutController::class, 'cart_detail']);
Route::post('/checkout',                  [CheckoutController::class, 'checkout']);
Route::get('/transaction',                [TransactionController::class, 'index']);
Route::post('/get-data',                  [TransactionController::class, 'get_data']);
Route::get('/check-status',               [CheckoutController::class, 'check_status']);
