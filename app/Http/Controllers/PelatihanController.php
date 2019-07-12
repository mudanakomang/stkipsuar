<?php

namespace App\Http\Controllers;

use App\PelatihanBits;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Session;
use Validator;
use App\ProdiBits;

class PelatihanController extends Controller
{
    public function getPelatihan(){
        $pelatihan=PelatihanBits::find(1);
        return view('admin.pelatihan.index')->with(compact('pelatihan'));
    }
    public function getProdi(){
        $prodi=ProdiBits::all();
        return view('admin.pelatihan.prodi')->with(compact('prodi'));
    }
    public function updatePelatihan(Request $request){
        $pelatihan=PelatihanBits::find(1);
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
            $pelatihan->isi=$request->isi;
            $pelatihan->publishdate= Carbon::parse($request->publishdate)->format('Y-m-d');
            $pelatihan->save();
            Session::flash('alert-success', 'Kontent berhasil diupdate');
            return redirect()->back();
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    
    public function addProdi(){
        $action='add';
        $prodi=new ProdiBits();
        return view('admin.pelatihan.add')->with(compact('action','prodi'));
    }
    public function editProdi($id){
        $action='edit';
        $prodi=ProdiBits::find($id);
        return view('admin.pelatihan.edit')->with(compact('action','prodi'));
    }
    public function prodiStore(Request $request){
     $message=array(
         'prodi.required'=>'Nama Prodi tidak boleh kosong',
         );   
         
     $rules=array(
         'prodi'=>'required',
         );
    $prodi=new ProdiBits();    
     $validator=Validator::make($request->all(),$rules,$message); 
     if(!$validator->fails()){
         $prodi->prodi=$request->prodi;
         $prodi->keterangan=$request->keterangan;
         $prodi->save();
         Session::flash('alert-success','Prodi berhasil ditambahkan');
         return redirect('/admin/pelatihan/prodi-bits');
     } else{
         return redirect()->back()->withErrors($validator)->withInput();
     }
         
    }
    public function prodiUpdate(Request $request,$id){
         $message=array(
         'prodi.required'=>'Nama Prodi tidak boleh kosong',
         );   
         
     $rules=array(
         'prodi'=>'required',
         );
     $prodi=ProdiBits::find($id);
     $validator=Validator::make($request->all(),$rules,$message);     
         
     if(!$validator->fails()){
         $prodi->prodi=$request->prodi;
         $prodi->keterangan=$request->keterangan;
         $prodi->save();
         Session::flash('alert-success','Prodi berhasil diupdate');
         return redirect('/admin/pelatihan/prodi-bits');
     } else{
         return redirect()->back()->withErrors($validator)->withInput();
     }
     
    }
    public function hapusProdi($id){
        ProdiBits::where('id','=',$id)
        ->delete();
         Session::flash('alert-success','Prodi berhasil dihapus');
        return redirect('/admin/pelatihan/prodi-bits'); 
    }
    public function index(){
       $pelatihan=PelatihanBits::find(1);
       return view('pelatihan.pelatihan-bits.index')->with(compact('pelatihan'));
    }
    public function prodi(){
        $prodi=ProdiBits::all();
        return view('pelatihan.pelatihan-bits.prodi')->with(compact('prodi'));
    }
}
