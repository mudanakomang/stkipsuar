<?php

namespace App\Http\Controllers;

use App\GeneralSettings;
use App\Slider;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rules\In;
use Validator;
use Illuminate\Support\Facades\Session;
use URL;

class AdminController extends Controller
{
    public function index()
    {
        $general=GeneralSettings::find(1);
        return view('admin.index')->with(compact('general'));
    }
    public function sliderAdd(){
        $sliders=new Slider();
        $action='add';
        $general=GeneralSettings::find(1);
        return view('admin.addslider')->with(compact('sliders','action','general'));
    }
    public function update(Request $request){
       $data= GeneralSettings::find(1);
        $data->nama= $request->nama;
        $data->alamat1=$request->alamat1;
        $data->alamat2=$request->alamat2;
        $data->alamat3=$request->alamat3;
        $data->ta_start=Carbon::parse($request->start)->format('Y-m-d');
        $data->ta_end=Carbon::parse($request->end)->format('Y-m-d');
        $data->telp=$request->telp;
        $data->email=$request->email;
        $data->fb=$request->fb;
        $data->twitter=$request->twitter;
        $data->gplus=$request->gplus;
        $data->maps=$request->maps;
        $data->youtube=$request->youtube;
        $data->save();
        Session::flash('alert-success', 'Data berhasil diupdate');
        return redirect()->back();
    }
    public function slider(){

        $general= GeneralSettings::find(1);
        $sliders=Slider::all();
        return view('admin.slider')->with(compact('general','sliders'));
    }
    public function sliderStore(Request $request){
      $messages=array(
          'judul.required'=>'Judul tidak boleh kosong',
          'deskripsi.required'=>'Deskripsi tidak boleh kosong',
          'gambar.required'=>'Gambar masih kosong',
          'gambar.mimes'=>'Format tidak valid',
          'gambar.max'=>'Gambar tidak boleh lebih dari 500 Kb',
      );
      $rules=array(
          'judul'=>'required',
          'deskripsi'=>'required',
          'gambar'=>'required|image|mimes:jpg,jpeg,png,bmp|max:500',
      );
      $validator=Validator::make($request->all(),$rules,$messages);
        if (!$validator->fails()) {
            $file = $request->file('gambar');
            $destionation = public_path() . '/img/slider';
            $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
            $file->move($destionation, $name);
            $slider = new Slider();
            $slider->judul = $request->judul;
            $slider->deskripsi = $request->deskripsi;
            $slider->gambar = $name;
            $slider->status = $request->status;
            $slider->link=$request->link;
            $slider->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/content/slider');
        }else {
            return redirect()->back()->withErrors($validator)->withInput();
        }

    }
    public function edit($id){

        $sliders=Slider::find($id);
        $general= GeneralSettings::find(1);
        $action='edit';
        return view('admin.editslider')->with(compact('sliders','general','action'));
    }

    public function sliderUpdate(Request $request,$id){
        $slider=Slider::find($id);
        $messages=array(
            'judul.required'=>'Judul tidak boleh kosong',
            'deskripsi.required'=>'Deskripsi tidak boleh kosong',

        );
        $rules=array(
            'judul'=>'required',
            'deskripsi'=>'required',

        );

        $validator=Validator::make($request->all(),$rules,$messages);
        if (!$validator->fails()) {
            if ($request->hasFile('gambar'))
            {
                $file=$request->file('gambar');
            $destionation = public_path() . '/img/slider';
            $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
            $file->move($destionation, $name);$slider->gambar = $name;
            }
            $slider->judul = $request->judul;
            $slider->deskripsi = $request->deskripsi;

            $slider->status = $request->status;
            $slider->link=$request->link;
            $slider->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/content/slider');
        }else {
            return redirect()->back()->withErrors($validator)->withInput();
        }

    }
    public function hapus($id){
        $slider=Slider::find($id);
        $slider->delete();
        Session::flash('alert-success', 'Data berhasil dihapus');
        return redirect('admin/content/slider');
    }

}
