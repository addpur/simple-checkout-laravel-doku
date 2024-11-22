<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class HomeController extends Controller
{
    public function save_session_user(Request $request)
    {
        Session::put('auth', $request->data);

        return response()->json(['success']);
    }

    public function delete_session_user()
    {
        Session::forget('auth');

        return response()->json(['success']);
    }

    public function index()
    {
        $user = Session::get('auth');

        if (Session::get('auth') == null) {
            return redirect('/reseller-login');
        }
        if ($user['user_type'] == 'Reseller') {
            return redirect('/reseller/dashboard');
        }
        return view('dashboard', compact('user'));
    }

    public function dashboard_reseller()
    {
        $user = Session::get('auth');
        if (Session::get('auth') == null) {
            return redirect('/reseller-login');
        }
        if ($user['user_type'] == 'Admin') {
            return redirect('/admin/dashboard');
        }
        return view('dashboard_seller', compact('user'));
    }


    //SLA
    public function privacy_policy()
    {
        return view('master.sla.pp');
    }

    public function terms_of_service()
    {
        return view('master.sla.tof');
    }
}
