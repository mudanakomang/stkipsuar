<?php

namespace App\Http\Controllers;

use App\Berita;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;
use Session;
class BeritaController extends Controller
{
    public function detailBerita($id){
        $berita=Berita::find($id);
        return view('berita.detail',['berita'=>$berita]);
    }
    public function allBerita(){
        $berita=Berita::orderBy('created_at', 'desc')->paginate(6);
        return view('berita.index',['berita'=>$berita]);
    }
    
    public  function getBerita(){
        $berita=Berita::all();
        return view('admin.berita.index')->with(compact('berita'));
    }
    public function beritaAdd(){
        $action='add';
        $berita=new Berita();
        return view('admin.berita.add')->with(compact('action','berita'));
    }
    public function beritaStore(Request $request){
        $messages=array(
            'judul.required'=>'Judul tidak boleh kosong',
            'isi.required'=>'Isi tidak boleh kosong',
            'gambar.mimes'=>'Format tidak valid',
            'gambar.max'=>'Gambar tidak boleh lebih dari 500 Kb',
            'tglterbit.required'=>'Tanggal terbit tidak boleh kosong',
        );
        $rules=array(
            'judul'=>'required',
            'isi'=>'required',
            'gambar'=>'image|mimes:jpg,jpeg,png,bmp|max:500',
            'tglterbit'=>'required',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $berita=new Berita();
        if(!$validator->fails()){
            if ($request->hasFile('gambar')){
                $file = $request->file('gambar');
                $destionation = public_path() . '/img/berita';
                $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                $file->move($destionation, $name);
                $berita->gambar=$name;
            }
            $berita->judul=$request->judul;
            $berita->isi=$request->isi;
            $berita->penerbit=$request->penerbit;
            $berita->tglterbit=Carbon::parse($request->tglterbit)->format('Y-m-d');
            $berita->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/berita');
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }

    }
    public function beritaEdit($id){
        $action='edit';
        $berita=Berita::find($id);
        return view('admin.berita.edit')->with(compact('action','berita'));
    }

    public function beritaUpdate(Request $request,$id){
        $messages=array(
            'judul.required'=>'Judul tidak boleh kosong',
            'isi.required'=>'Isi tidak boleh kosong',
            'gambar.mimes'=>'Format tidak valid',
            'gambar.max'=>'Gambar tidak boleh lebih dari 500 Kb',
            'tglterbit.required'=>'Tanggal terbit tidak boleh kosong',
        );
        $rules=array(
            'judul'=>'required',
            'isi'=>'required',
            'gambar'=>'image|mimes:jpg,jpeg,png,bmp|max:500',
            'tglterbit'=>'required',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $berita=Berita::find($id);
        $destionation = public_path() . '/img/berita';
        if (!$validator->fails()){
            if ($request->hasFile('gambar')){
                if ($berita->gambar!=''){
                    $file = $request->file('gambar');
                    $file->move($destionation, $berita->gambar);
                }else {
                    $file = $request->file('gambar');
                    $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                    $file->move($destionation, $name);
                    $berita->gambar = $name;
                }
        }
            $berita->judul=$request->judul;
            $berita->isi=$request->isi;
            $berita->penerbit=$request->penerbit;
            $berita->tglterbit=Carbon::parse($request->tglterbit)->format('Y-m-d');
            $berita->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/berita');
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    public function beritaHapus($id){
        $berita=Berita::find($id);
        $berita->delete();
        unlink(public_path().'/img/berita/'.$berita->gambar);
        Session::flash('alert-success', 'Data berhasil dihapus');
        return redirect('admin/berita');
    }
}
