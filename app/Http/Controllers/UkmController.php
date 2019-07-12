<?php

namespace App\Http\Controllers;


use App\Ukm;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rules\In;
use Validator;
use Illuminate\Support\Facades\Session;
use URL;

class UkmController extends Controller
{
  public function getUkm($id){
      $ukm=Ukm::find($id);
      return view('admin.akademik.ukm.index',['ukm'=>$ukm]);
  }
}
