<?php

namespace App\Http\Controllers;

use App\Galeri;
use Illuminate\Http\Request;
use Validator;
use Session;
use Carbon\Carbon;

class GaleriController extends Controller
{
  public function indexAdmin(){
    $galeri=Galeri::all();
    return view('admin.galeri.index',['galeri'=>$galeri]);
  }
  public function add(){
     $action='add';
     $galeri = new Galeri();
     return view('admin.galeri.add')->with(compact('action','galeri'));
  }
  
  public function edit($id){
      $action='edit';
      $galeri=Galeri::find($id);
      return view('admin.galeri.edit')->with(compact('action','galeri'));
  }
  public function galeriStore(Request $request){
          $messages=array(
         
          'gambar.required'=>'Gambar masih kosong',
          'gambar.mimes'=>'Format tidak valid',
          'gambar.max'=>'Gambar tidak boleh lebih dari 1000 Kb',
      );
      $rules=array(
        
          'gambar'=>'required|image|mimes:jpg,jpeg,png,bmp|max:1000',
      );
      $validator=Validator::make($request->all(),$rules,$messages);
        if (!$validator->fails()) {
            $file = $request->file('gambar');
            $destionation = public_path() . '/img/galeri';
            $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
            $file->move($destionation, $name);
            $galeri = new Galeri();
            $galeri->keterangan = $request->keterangan;
            $galeri->gambar = $name;
            $galeri->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/galeri');
        }else {
            return redirect()->back()->withErrors($validator)->withInput();
        }

  }
  public function galeriUpdate(Request $request,$id){
       $galeri=Galeri::find($id);
        $messages=array(
          'gambar.mimes'=>'Format tidak valid',
          'gambar.max'=>'Gambar tidak boleh lebih dari 1000 Kb',
      );
      $rules=array(
        
          'gambar'=>'image|mimes:jpg,jpeg,png,bmp|max:1000',
      );

        $validator=Validator::make($request->all(),$rules,$messages);
        if (!$validator->fails()) {
            if ($request->hasFile('gambar'))
            {
                if(!file_exists($galeri->gambar)){
                    $file=$request->file('gambar');
                    $destionation = public_path() . '/img/galeri';
                    $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                    $file->move($destionation, $name);
                    $galeri->gambar = $name;
                }
            }
            $galeri->keterangan = $request->keterangan;
             $galeri->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/galeri');
        }else {
            return redirect()->back()->withErrors($validator)->withInput();
        }
  }
  public function hapus($id){
     $galeri= Galeri::find($id);
     unlink('public/img/galeri/'.$galeri->gambar);
     $galeri->delete();
       Session::flash('alert-success', 'Data berhasil dihapus');
       return redirect('admin/galeri');
  }
  
  public function index(){
      $galeri=Galeri::orderBy('created_at', 'desc')->paginate(8);
      return view('galeri.index',['galeri'=>$galeri]);
    
  }
}