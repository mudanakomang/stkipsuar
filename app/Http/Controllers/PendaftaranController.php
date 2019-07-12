<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Validation\Rules\In;
use Validator;
use Illuminate\Support\Facades\Session;
use URL;
use App\Alumni;
use App\Kegiatan;
use App\FotoKegiatan;
use App\Pendaftaran;

class PendaftaranController extends Controller
{
   public function pendaftaran(){
       return view('pendaftaran.index');
   }
   
   public function cek($id){
       $pendaftaran=Pendaftaran::where('kode','',$id)->first();
     
       return view('pendaftaran.cek',['pendaftaran'=>$pendaftaran,'id'=>$id]);
   }
   public function pendaftaran1($id){
       $pendaftaran=new Pendaftaran();
       return view('pendaftaran.pendaftaran1',['id'=>$id,'pendaftaran'=>$pendaftaran]);
   }
   public function pendaftaran1Store(Request $request){
   
      $message = array(
        'nama.required'=>'Nama Tidak Boleh Kosong',
        'tempat_lahir.required' => 'Tempat Lahir Tidak Boleh Kosong',
        'tgl_lahir.required'=>'Tanggal Lahir Tidak Boleh Kosong',
        'agama.required'=>'Agama Tidak Boleh Kosong',
        'jenis_kelamin.required'=>'Jenis Kelamin Tidak Boleh Kosong',
        'asal_sekolah.required'=>'Asal Sekolah Tidak Boleh Kosong',
        'nama_ortu.required'=>'Nama Orang Tua Tidak Boleh Kosong',
        'alamat_ortu.required'=>'Alamat Orang Tua Tidak Boleh Kosong',
        'email.required'=>'Wajib diisi',
        'email.unique'=>'Email sudah digunakan',
        'email.email'=>'Email tidak valid',
        'prodi.required'=>'Wajib memilih jurusan',
      );
      $rules = array(
        'nama' => 'required',
        'tempat_lahir'=>'required',
        'tgl_lahir'=>'required',
        'agama'=>'required',
        'jenis_kelamin'=>'required',
        'asal_sekolah'=>'required',
        'nama_ortu'=>'required',
        'alamat_ortu'=>'required',
        'email'=>'required|email|unique:pendaftaran',
        'prodi'=>'required',
       );
      $validator=Validator::make($request->all(),$rules,$message);
      if (!$validator->fails()) {
        dd($request->all());
      } else{
        return redirect()->back()->withErrors($validator)->withInput();
      }
   }
}