<?php

namespace App\Http\Controllers;

use App\Fasilitas;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Session;
use Validator;

class FasilitasController extends Controller
{
    public function section(Request $request){
        $section=str_slug($request->section,'-');
        $fas=\App\Fasilitas::all();

        foreach ($fas as $fasilitas) {
            if(str_slug($fasilitas->attribute,'-')==$section) {
                return view('fasilitas.index')->with(compact('fasilitas'));
            }
        }


    }

    public function getFasilitas($id){

        $fasilitas=Fasilitas::find($id);
        return view('admin.fasilitas.index')->with(compact('fasilitas'));
    }

    public function edit(Request $request){

        $fasilitas=Fasilitas::find($request->atribut);
        $messages=array(
            'gambar.mimes'=>'Format tidak valid',
            'gambar.max'=>'Gambar tidak boleh lebih dari 500 Kb',
        );
        $rules=array(
            'gambar'=>'image|mimes:jpg,jpeg,png,bmp|max:500',
        );
        $validator = Validator::make($request->all(),$rules,$messages);
        if(!$validator->fails()){


            $destionation = public_path() . '/img/fasilitas';
            if ($request->hasFile('gambar')) {
                $file=$request->file('gambar');
                $old=$fasilitas->gambar;
                if(file_exists($destionation.'/'.$old))
                {
                    unlink($destionation.'/'.$old);
                }
                $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                $file->move($destionation, $name);
                $fasilitas->gambar=$name;
            }




            $fasilitas->value=$request->value;
            $fasilitas->publishdate=$request->publishdate;
            $fasilitas->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect()->back();
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
}
