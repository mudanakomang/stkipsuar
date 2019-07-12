<?php

namespace App\Http\Controllers;

use App\Penelitian;
use Illuminate\Http\Request;
use Validator;
use Session;

class PenelitianController extends Controller
{
    public function getPenelitian(){
        $penelitian=Penelitian::find(1);
        return view('admin.penelitian.index')->with(compact('penelitian'));
    }
    public function update(Request $request){
        $penelitian=Penelitian::find(1);
        $rule=array(
            'isi.required'=>'Kontent tidak boleh kosong',
            'publishdate.required'=>'Tanggal terbit tidak boleh kosong',
        );
        $message=array(
            'isi'=>'required',
            'publishdate'=>'required'
        );
       $validator=Validator::make($request->all(),$rule,$message);
       if (!$validator->fails()){
           $penelitian->isi=$request->isi;
           $penelitian->publishdate=$request->publishdate;
           $penelitian->save();
           Session::flash('alert-success', 'Kontent berhasil diupdate');
           return redirect()->back();
       } else{
           return redirect()->back()->withErrors($validator)->withInput();
       }
    }
    public function index(){
        $penelitian=Penelitian::find(1);
        return view('penelitian.index')->with(compact('penelitian'));
    }

}
