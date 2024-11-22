<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CartModel extends Model
{
    use HasFactory;

    function getCartH()
    {
        return DB::table('cart')
            ->first();
    }

    function getCartD($id)
    {
        return DB::table('cart_detail')
            ->get();
    }
}
