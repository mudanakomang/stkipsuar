<?php

namespace App\Http\Controllers;

use App\PedomanAkademik;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;
use App\GeneralSettings;
use Session;

class PedomanController extends Controller
{

        public function download(){
            $general=GeneralSettings::find(1);
            $ts=Carbon::createFromFormat('Y-m-d',$general->ta_start)->format('Y');
            $te=Carbon::createFromFormat('Y-m-d',$general->ta_end)->format('Y');
            $name='Pedoman Akademik Tahun Ajaran '.$ts.' - '.$te.'.pdf' ;
            $path= public_path() . '/file/pedoman';
            return response()->download($path.'/'.$name);

    }
    public function getPedoman(){
        $pedoman=PedomanAkademik::find(1);
        return view('admin.akademik.pedoman.index')->with(compact('pedoman'));
    }
    public function index(){
        $pedoman=PedomanAkademik::find(1);

        return view('pedoman.index')->with(compact('pedoman'));
    }
    public function update(Request $request){
        $general=GeneralSettings::find(1);
        $ts=Carbon::createFromFormat('Y-m-d',$general->ta_start)->format('Y');
        $te=Carbon::createFromFormat('Y-m-d',$general->ta_end)->format('Y');
        $pedoman=PedomanAkademik::find($request->id);
        $messages=array(
            'cover.mimes'=>'Format tidak valid',
            'file.mimes'=>'Format tidak valid',
            'publishdate.required'=>'Tanggal terbit harus diisi',
            'cover.max'=>'Gambar tidak boleh lebih dari 2MB',
            'file.max'=>'File tidak boleh lebih dari 2MB',
        );
        $rules=array(
            'cover'=>'image|mimes:jpg,jpeg,png,bmp|max:2000',
            'file'=>"mimes:pdf|max:2000",
            'publishdate'=>'required',
        );
        if ($request->hasFile('file') || $request->hasFile('cover')) {
            $validator = Validator::make($request->all(), $rules, $messages);
            if (!$validator->fails()) {
                if ($request->hasFile('cover')){
                    $cover=$request->file('cover');
                    $covdest=public_path().'/img/pedoman';
                    $covername='cover.'.$cover->getClientOriginalExtension();
                    $cover->move($covdest,$covername);
                    $pedoman->cover=$covername;
                }
                if($request->hasFile('file')){
                    $file=$request->file('file');
                    $filedest=public_path().'/file/pedoman';
                    $filename='Pedoman Akademik Tahun Ajaran '. $ts.' - '.$te.'.'.$file->getClientOriginalExtension();
                    $file->move($filedest,$filename);
                }
            $pedoman->publishdate=Carbon::parse($request->publishdate)->format('Y-m-d');
            $pedoman->save();

                Session::flash('alert-success', 'File berhasil diupload');
                return redirect()->back();
            } else
            {
                return redirect()->back()->withErrors($validator)->withInput();
            }
        }
    }
}
