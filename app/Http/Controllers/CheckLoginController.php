<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class CheckLoginController extends Controller
{
    public function check(){
        if(Auth::user()->roles[0]->name=='admin'){
            return redirect('admin');
        }
        elseif(Auth::user()->roles[0]->name=='dosen')
        {
            return redirect('dosen');
        }
    }
}
