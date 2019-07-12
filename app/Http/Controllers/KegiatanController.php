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

class KegiatanController extends Controller
{
   
    public function index(){
       $kegiatan=Kegiatan::orderBy('created_at', 'desc')->paginate(6);
       $foto=[];
       foreach($kegiatan as $k){
        array_push($foto,$k->foto);
       }
      
        return view('kegiatan.index',['kegiatan'=>$kegiatan,'foto'=>$foto]);
  
  }
  public function getKegiatan(){
        $kegiatan=Kegiatan::all();
        return view('admin.kegiatan.index',['kegiatan'=>$kegiatan]);
  }
  public function addKegiatan(){
      $kegiatan= new Kegiatan();
      return view('admin.kegiatan.add',['kegiatan'=>$kegiatan,'action'=>'add']);
  }
  public function kegiatanEdit($id){
        $action='edit';
        $kegiatan=Kegiatan::find($id);
        return view('admin.kegiatan.edit')->with(compact('action','kegiatan'));
    }

    public function kegiatanUpdate(Request $request,$id){
      
        $messages=array(
            'nama.required'=>'Nama Kegiatan tidak boleh kosong',
            'keterangan.required'=>'Keterangan tidak boleh kosong',
            'tgl.required'=>'Tanggal tidak boleh kosong',
        );
        $rules=array(
            'nama'=>'required',
            'keterangan'=>'required',
            'tgl'=>'required',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $kegiatan=Kegiatan::find($id);
        if (!$validator->fails()){
            $kegiatan->nama=$request->nama;
            $kegiatan->keterangan=$request->keterangan;
            $kegiatan->tgl=Carbon::parse($request->tgl)->format('Y-m-d');
            $kegiatan->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/kegiatan');
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    
    public function kegiatanStore(Request $request){
        $messages=array(
            'nama.required'=>'Nama kegitan tidak boleh kosong',
            'keterangan.required'=>'Keterangan tidak boleh kosong',
            'tgl.required'=>'Tanggal tidak boleh kosong',
        );
        $rules=array(
            'nama'=>'required',
            'keterangan'=>'required',
            'tgl'=>'required',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $kegiatan=new Kegiatan();
        if(!$validator->fails()){
            $kegiatan->nama=$request->nama;
            $kegiatan->keterangan=$request->keterangan;
            $kegiatan->tgl=Carbon::parse($request->tgl)->format('Y-m-d');
            $kegiatan->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/kegiatan');
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    
    public function kegiatanHapus($id){
        $kegiatan=Kegiatan::find($id);
        $foto=$kegiatan->foto;
       foreach($foto as $f){
          $kegiatan->foto()->detach($f->id);
          unlink(public_path().'/img/kegiatan/'.$id.'/'.$f->gambar);
       }
        rmdir(public_path().'/img/kegiatan/'.$id);
        $kegiatan->delete();
        Session::flash('alert-success', 'Data berhasil dihapus');
            return redirect('admin/kegiatan');
    }
    
    public function addPic($id){
        $kegiatan=Kegiatan::find($id);
        $foto=$kegiatan->foto;
        return view('admin.kegiatan.addpic',['id'=>$id,'foto'=>$foto]);
    }
    public function fotoStore(Request $request){
       $messages=array(
            'gambar.required'=>'Gambar tidak boleh kosong',
            'gambar.mimes'=>'Format tidak valid',
            'gambar.max'=>'Gambar tidak boleh lebih dari 500 Kb',
        );
        $rules=array(
         
            'gambar'=>'required|image|mimes:jpg,jpeg,png,bmp|max:500',
          
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $kegiatan=Kegiatan::find($request->id);
        $foto=new FotoKegiatan();
        if(!$validator->fails()){
            if ($request->hasFile('gambar')){
                $file = $request->file('gambar');
                $destionation = public_path() . '/img/kegiatan/'.$request->id;
                $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                $file->move($destionation, $name);
                $foto->gambar=$name;
                 $foto->save();
                $kegiatan->foto()->attach($foto);
               
            }
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/kegiatan/picture_add/'.$request->id);
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    public function fotoEdit($id){
        $foto=FotoKegiatan::find($id);
        return view('admin.kegiatan.editpic',['foto'=>$foto]);
    }
    public function fotoUpdate(Request $request,$id){
        $messages=array(
            'gambar.required'=>'Gambar tidak boleh kosong',
            'gambar.mimes'=>'Format tidak valid',
            'gambar.max'=>'Gambar tidak boleh lebih dari 500 Kb',
        );
        $rules=array(
         
            'gambar'=>'required|image|mimes:jpg,jpeg,png,bmp|max:500',
          
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $foto=FotoKegiatan::find($id);
        $kegiatan=$foto->kegiatan[0]->id;
        $destionation = public_path() . '/img/kegiatan/'.$kegiatan;
                if (!$validator->fails()){
                    if ($request->hasFile('gambar')){
                        if ($foto->gambar!=''){
                            $file = $request->file('gambar');
                            $file->move($destionation, $foto->gambar);
                        }else {
                            $file = $request->file('gambar');
                            $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                            $file->move($destionation, $name);
                            $foto->gambar = $name;
                        }
                }
           
            $foto->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/kegiatan/picture_add/'.$kegiatan);
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    
    public function hapusFoto(Request $request){
        foreach($request->data as $key=>$v){
         $foto=FotoKegiatan::find($v);
         $kegiatan=$foto->kegiatan[0]->id;
         unlink(public_path().'/img/kegiatan/'.$kegiatan.'/'.$foto->gambar);
         $foto->kegiatan()->detach($kegiatan);
         $foto->delete();
          Session::flash('alert-success', 'Data berhasil dihapus');
            return redirect('admin/kegiatan/picture_add/'.$kegiatan);
        }
    }
    public function detail($id){
        $kegiatan=Kegiatan::find($id);
        return view('kegiatan.detail',['kegiatan'=>$kegiatan]);
    }
}
