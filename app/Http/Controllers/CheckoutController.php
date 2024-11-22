<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CartModel;
use App\Models\CheckoutModel;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    private $cartModel, $checkoutModel;
    public function __construct()
    {
        $this->cartModel = new CartModel();
        $this->checkoutModel = new CheckoutModel();
    }

    public function index()
    {
        $data = $this->cartModel->getCartH();
        return view('order.checkout.index', compact('data'));
    }

    function cart_detail(Request $request)
    {
        return $this->cartModel->getCartD($request->cartId);
    }

    public function checkout(Request $request)
    {
        return $this->checkoutModel->checkout($request->cartId);
    }

    public function check_status()
    {
        return $this->checkoutModel->checkStatus();
    }
}
