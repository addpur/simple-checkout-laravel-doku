<?php
namespace App\Helpers;

class TanggalFormatIndo 
{
    public static function getTanggal($date)
    {
        date_default_timezone_set("Asia/Jakarta");
        $date = $date ? $date : date('Y-m-d');
        return date('d', strtotime($date)) . '-' . date('m', strtotime($date)) . '-' . date('Y', strtotime($date));
    }

    public static function getBulan($date)
    {
        $index = date('n', strtotime($date));
        $bulan = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        return $bulan[$index];
    }

    public static function getHari($date)
    {
        $index = date('w', strtotime($date));
        $hari  = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu'];
        return $hari[$index];
    }

    public static function getDate($date)
    {
        date_default_timezone_set("Asia/Jakarta");
        $date = $date ? $date : date('Y-m-d');
        return date('d', strtotime($date)) . ' ' . TanggalFormatIndo::getBulan($date) . ' ' . date('Y', strtotime($date));
    }

    public static function getMonth($index)
    {
        $bulan = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        return $bulan[$index];
    }

}