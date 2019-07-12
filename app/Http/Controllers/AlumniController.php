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

class AlumniController extends Controller
{
    public function hapus(Request $request){
       foreach($request->data as $key=>$value){
            $alumni=Alumni::find($value);
            $alumni->delete();
       }
        Session::flash('alert-success', 'Data berhasil dihapus');
       return redirect()->back();
    }
    public function index(){
        $periode=Alumni::select('periode')->groupBy('periode')->paginate(6, ['*'], 'periode');
        $jurusan=Alumni::select('jurusan')->groupBy('jurusan')->paginate(6, ['*'], 'jurusan');
        return view('alumni.index',['periode'=>$periode,'jurusan'=>$jurusan]);
    }
    public function byperiode($id){
        $alumni=Alumni::where('periode','=',$id)->get();
        return view('alumni.periode',['alumni'=>$alumni]);
    }
    public function byjurusan($id){
         $jurusan=Alumni::where('jurusan','=',$id)->get();
        return view('alumni.jurusan',['jurusan'=>$jurusan]);
    }
  public function getAlumni(){
      $alumni=Alumni::all();
      return view('admin.alumni.index',['alumni'=>$alumni]);
  }
  public function download(){
      return response()->download('public/file/alumni/template.csv','template.csv',['Content-type' => 'text/csv']);
      
  }
  
  public function import(Request $request){
      if($request->hasFile('file')){
          $file=$request->file('file');
         $name='alumni.csv';
         $file->move(public_path().'/file/alumni',$name);
   
     $alumni = fopen(public_path().'/file/alumni/alumni.csv','r');  // Here example is a CSV name
    $row = 1;
    $arr=[];
    while (($line = fgetcsv($alumni, 10000, ",")) !== FALSE) {
        if($row == 1){ $row++; continue; }   // continue is used for skip row 1
       array_push($arr,$line);
        }
       
        foreach($arr as $key=>$value){
           $nim=$value[0];
           $nama=$value[1];
           $jurusan=$value[2];
           $periode=$value[3];
           $ipk=$value[4];
           Alumni::updateOrCreate(
               ['nim'=>$nim],
               ['nama'=>$nama,'jurusan'=>$jurusan,'periode'=>$periode,'ipk'=>$ipk]
               );
        }
        
      }
      Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/alumni');
  }
}
