<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CheckoutModel extends Model
{
    use HasFactory;

    private $dokuModel;
    public function __construct()
    {
        $this->dokuModel = new DokuModel();
    }

    function checkout($cartId)
    {
        $cart = DB::table('cart')->where('id', $cartId)->first();
        $cartDetail = DB::table('cart_detail')->where('cart_id', $cartId)->get();
        $trxCode = "TRX-" . date('YmdHis');

        //insert Order
        $orderId = DB::table('order')
            ->insertGetId([
                'trx_code'       => $trxCode,
                'name'           => $cart->name,
                'email'          => $cart->email,
                'address'        => $cart->address,
                'phone_number'   => $cart->phone_number,
                'country'        => $cart->country,
                'total_price'    => $cart->total_price,
                'delivery_fee'   => $cart->delivery_fee,
                'grand_total'    => $cart->grand_total,
                'status'         => "Pending",
            ]);

        $detail = [];
        foreach ($cartDetail as $item) {
            array_push($detail, [
                "name" => $item->product_name,
                "price" => $item->price,
                "quantity" => $item->qty
            ]);

            //insert Order Detail
            DB::table('order_detail')
                ->insertGetId([
                    'order_id'          => $orderId,
                    'product_name'           => $item->product_name,
                    'image'          => $item->image,
                    'price'     => $item->price,
                    'qty'     => $item->qty,
                    'total_price'     => $item->total_price,
                ]);
        }

        $result = $this->dokuModel->checkout($cart, $detail, $trxCode);
        $paymentUrl = $result['response']['payment']['url'] ?? null;

        //update order
        DB::table('order')
            ->where('id', $orderId)
            ->update([
                'pay_code'       => $result['response']['order']['invoice_number'] ?? null,
                'payment_url'    => $paymentUrl,
                'expired_date'   => $result['response']['payment']['expired_date'] ?? null,
            ]);

        $response =  array(
            'payment_url' => $paymentUrl
        );
        return $response;
    }


    public function checkStatus()
    {
        $dataOrder = DB::table('order')
            ->where('status', 'Pending')
            ->limit('10')
            ->get();

        foreach ($dataOrder as $data) {
            $dataStatus = $this->dokuModel->checkStatus($data->trx_code, $data->pay_code);

            //payment timeout
            if ($data->pay_code == "") {
                DB::table('order')
                    ->where('id', $data->id)
                    ->update([
                        'status' => "Expired"
                    ]);
            }

            //response error
            if ($dataStatus['error']['message'] ?? null != null) {
                $current_datetime = date('Y-m-d H:i:s');
                $given_datetime = date("Y-m-d H:i:s", strtotime($data->date_expayed));
                if ($current_datetime >= $given_datetime) {
                    $status = 'Expired';
                } else {
                    $status = 'Pending';
                }
                DB::table('order')
                    ->where('id', $data->id)
                    ->update([
                        'status' => $status
                    ]);
            }

            //response success
            if ($dataStatus['order']['invoice_number'] ?? null == $data->pay_code) {
                if ($dataStatus['transaction']['status'] == 'EXPIRED') {
                    $status = 'Expired';
                } elseif ($dataStatus['transaction']['status'] == 'SUCCESS') {
                    $status = 'Berhasil';
                } else {
                    $status = 'Pending';
                }
                DB::table('order')
                    ->where('id', $data->id)
                    ->update([
                        'status' => $status
                    ]);
            }
        }

        return TRUE;
    }
}
