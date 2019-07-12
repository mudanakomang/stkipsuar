<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Pengumuman;
use Carbon\Carbon;
use Validator;
use Session;
class PengumumanController extends Controller
{
    
    public function getPengumuman(){
         $pengumuman=Pengumuman::orderBy('created_at','desc')->get();
        return view('admin.pengumuman.index',['pengumuman'=>$pengumuman]);
    }
    
    public function pengumumanAdd(){
        $action='add';
        $pengumuman=new Pengumuman();
        return view('admin.pengumuman.add')->with(compact('action','pengumuman'));
    }
    public function pengumumanStore(Request $request){
        $messages=array(
            'judul.required'=>'Judul tidak boleh kosong',
            'isi.required'=>'Isi tidak boleh kosong',
            'tgl.required'=>'Tanggal terbit tidak boleh kosong',
        );
        $rules=array(
            'judul'=>'required',
            'isi'=>'required',
            'tgl'=>'required',
        );  
          $validator=Validator::make($request->all(),$rules,$messages);
          $pengumuman=new Pengumuman();
           if(!$validator->fails()){
               if ($request->hasFile('gambar')){
                $file = $request->file('gambar');
                $destionation = public_path() . '/img/pengumuman';
                $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                $file->move($destionation, $name);
                $pengumuman->gambar=$name;
            }
               $pengumuman->judul=$request->judul;
               $pengumuman->isi=$request->isi;
               $pengumuman->tgl=Carbon::parse($request->tgl)->format('Y-m-d');
               $pengumuman->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/pengumuman');
           } else{
                 return redirect()->back()->withErrors($validator)->withInput();
           }
          
    }
    
    public function pengumumanEdit($id){
      
    
      $action='edit';
      $pengumuman=Pengumuman::find($id);
      return view('admin.pengumuman.edit')->with(compact('action','pengumuman'));
    }
    public function pengumumanUpdate(Request $request, $id){
         $messages=array(
            'judul.required'=>'Judul tidak boleh kosong',
            'isi.required'=>'Isi tidak boleh kosong',
            'tgl.required'=>'Tanggal terbit tidak boleh kosong',
        );
        $rules=array(
            'judul'=>'required',
            'isi'=>'required',
            'tgl'=>'required',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $pengumuman=Pengumuman::find($id);
         $destionation = public_path() . '/img/pengumuman';
        if (!$validator->fails()){
             if ($request->hasFile('gambar')){
                if ($pengumuman->gambar!=''){
                    $file = $request->file('gambar');
                    $file->move($destionation, $pengumuman->gambar);
                }else {
                    $file = $request->file('gambar');
                    $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                    $file->move($destionation, $name);
                    $pengumuman->gambar = $name;
                }
        }
            $pengumuman->judul=$request->judul;
            $pengumuman->isi=$request->isi;
            $pengumuman->tgl=Carbon::parse($request->tgl)->format('Y-m-d');
            $pengumuman->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/pengumuman');
        }else{
             return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    public function pengumumanHapus($id){
        $pengumuman=Pengumuman::find($id);
        $pengumuman->delete();
        Session::flash('alert-success', 'Data berhasil dihapus');
        return redirect('admin/pengumuman');
    }
    public function allPengumuman(){
         $pengumuman=Pengumuman::orderBy('created_at', 'desc')->paginate(6);

        return view('pengumuman.index',['pengumuman'=>$pengumuman]);
    }
    public function detailPengumuman($id){
          $pengumuman=Pengumuman::find($id);
        return view('pengumuman.detail',['pengumuman'=>$pengumuman]);
    }
}
