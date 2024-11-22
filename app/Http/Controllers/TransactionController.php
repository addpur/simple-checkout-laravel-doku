<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\TransactionModel;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    private $transactionModel;
    public function __construct()
    {
        $this->transactionModel = new TransactionModel();
    }

    public function index()
    {
        return view('order.transaction.index');
    }

    public function get_data(Request $request)
    {
        return $this->transactionModel->getTransaction($request);
    }
}
