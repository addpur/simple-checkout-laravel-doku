<?php

namespace App\Helpers;

class UangFormat
{
	public static function rupiah($angka, $format = false)
	{
		if ($format == false) {
			$hasil_rupiah = number_format($angka, 0, ',', '.');
			return $hasil_rupiah;
		}
		$hasil_rupiah = $format . ". " . number_format($angka, 0, ',', '.');
		return $hasil_rupiah;
	}

	public static function penyebut($nilai)
	{
		$nilai = abs($nilai);
		$huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
		$temp = "";
		if ($nilai < 12) {
			$temp = " " . $huruf[$nilai];
		} else if ($nilai < 20) {
			$temp = UangFormat::penyebut($nilai - 10) . " belas";
		} else if ($nilai < 100) {
			$temp = UangFormat::penyebut($nilai / 10) . " puluh" . UangFormat::penyebut($nilai % 10);
		} else if ($nilai < 200) {
			$temp = " seratus" . UangFormat::penyebut($nilai - 100);
		} else if ($nilai < 1000) {
			$temp = UangFormat::penyebut($nilai / 100) . " ratus" . UangFormat::penyebut($nilai % 100);
		} else if ($nilai < 2000) {
			$temp = " seribu" . UangFormat::penyebut($nilai - 1000);
		} else if ($nilai < 1000000) {
			$temp = UangFormat::penyebut($nilai / 1000) . " ribu" . UangFormat::penyebut($nilai % 1000);
		} else if ($nilai < 1000000000) {
			$temp = UangFormat::penyebut($nilai / 1000000) . " juta" . UangFormat::penyebut($nilai % 1000000);
		} else if ($nilai < 1000000000000) {
			$temp = UangFormat::penyebut($nilai / 1000000000) . " milyar" . UangFormat::penyebut(fmod($nilai, 1000000000));
		} else if ($nilai < 1000000000000000) {
			$temp = UangFormat::penyebut($nilai / 1000000000000) . " trilyun" . UangFormat::penyebut(fmod($nilai, 1000000000000));
		}
		return $temp;
	}

	public static function terbilang($nilai)
	{
		if ($nilai < 0) {
			$hasil = "minus " . trim(UangFormat::penyebut($nilai));
		} else {
			$hasil = trim(UangFormat::penyebut($nilai));
		}
		return $hasil . " rupiah";
	}
}
