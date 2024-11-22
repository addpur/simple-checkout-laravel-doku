<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class TransactionModel extends Model
{
    use HasFactory;

    function getTransaction($request)
    {
        $dateStart = date("Y-m-d", strtotime($request->startDate));
        $dateEnd = date("Y-m-d", strtotime($request->endDate . "+1 days"));

        return DB::table('order')
            ->whereBetween('created_at', [$dateStart, $dateEnd])
            ->get();
    }
}
