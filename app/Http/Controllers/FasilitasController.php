<?php

namespace App\Http\Controllers;

use App\Fasilitas;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Session;
use Validator;

class FasilitasController extends Controller
{
    public function admSkripsiEdit($id){
        $action='edit';
        $skripsi=\App\Skripsi::find($id);        
        return view('admin.fasilitas.editskripsi',['action'=>$action,'skripsi'=>$skripsi]);
    }
    public function deleteSkripsi($id){
        $skripsi =\App\Skripsi::find($id);
        if(file_exists(public_path().'/file/skripsi/'.$skripsi->abstrak_file)){
            unlink(public_path().'/file/skripsi/'.$skripsi->abstrak_file);
        }       
        if(file_exists(public_path().'/file/skripsi/'.$skripsi->full)){
            unlink(public_path().'/file/skripsi/'.$skripsi->full);
        }
        $skripsi->delete();
        Session::flash('alert-success', 'Data berhasil dihapus');
        return redirect()->back();
    }
    public function admSkripsi(){
        $skripsi=\App\Skripsi::paginate(15);
        return view('admin.fasilitas.skripsi',['skripsi'=>$skripsi]);
    }
    public function admSkripsiAdd(){
        $action='add';
        $skripsi=new \App\Skripsi();
        return view('admin.fasilitas.addskripsi',['action'=>$action,'skripsi'=>$skripsi]);
    }
    public function skripsiUpdate(Request $request,$id){
        $rules=[            
            'abstrak_file'=>'mimes:pdf|max:5000',           
            'full'=>'mimes:pdf|max:10000',
            'judul'=>'required',
            'nama'=>'required',
            'nim'=>'required',
            'program'=>'required',
            'abstrak_text'=>'required',
            'tgl_terbit'=>'required',
        ];
        $messages=[            
            'abstrak_file.mimes'=>'Format tidak valid, pilih file PDF',
            'abstrak_file.max'=>'File tidak boleh lebih dari 5MB',           
            'full.mimes'=>'Format tidak valid, pilih file PDF',
            'full.max'=>'File tidak boleh lebih dari 10MB',
            'judul.required'=>'Judul masih kosong',
            'nama.required'=>'Nama masih kosong',
            'nim.required'=>'NIM masih kosong',
            'program.required'=>'Program studi masih kosong',
            'abstrak_text.required'=>'Teks abstrak masih kosong',
            'tgl_terbit.required'=>'Tanggal terbit masih kosong'
        ];
        $validator = Validator::make($request->all(),$rules,$messages);
        $skripsi=\App\Skripsi::find($id);
        $destionation=public_path().'/file/skripsi';
        
        if(!$validator->fails()){           
            if($request->hasFile('abstrak_file')){ 
                if(file_exists($destionation.'/'.$skripsi->abstrak_file)){        
                        unlink($destionation.'/'.$skripsi->abstrak_file);
                }
               $fileabstrak=$request->file('abstrak_file');               
               $abstrakname='abstrak-'.$request->nim.'-'.\Carbon\Carbon::parse($request->tgl_terbit)->format('Ymd').'.'.$fileabstrak->getClientOriginalExtension();
               $fileabstrak->move($destionation,$abstrakname);
               $skripsi->abstrak_file=$abstrakname;
            }
            if($request->hasFile('full')){
                
                if(file_exists($destionation.'/'.$skripsi->full)){  
                                  
                    unlink($destionation.'/'.$skripsi->full);
                }
               
                $filefull=$request->file('full');
                
                $fullname='full-'.$request->nim.'-'.\Carbon\Carbon::parse($request->tgl_terbit)->format('Ymd').'.'.$filefull->getClientOriginalExtension();   
               
                $filefull->move($destionation,$fullname);
                $skripsi->full=$fullname;      
            }
            $skripsi->judul=$request->judul;
            $skripsi->nama=$request->nama;
            $skripsi->nim=$request->nim;
            $skripsi->program=$request->program;
            $skripsi->pembimbing1=$request->pembimbing1;
            $skripsi->nidn1=$request->nidn1;
            $skripsi->pembimbing2=$request->pembimbng2;
            $skripsi->nidn2=$request->nidn2;
            $skripsi->abstrak_text=$request->abstrak_text;
            $skripsi->tgl_terbit=\Carbon\Carbon::parse($request->tgl_terbit)->format('Y-m-d');
            $skripsi->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/fasilitas/repos/skripsi');
        } else {
            return redirect()->back()->withErrors($validator)->withInput();
        }
    

    }
    public function storeSkripsi(Request $request){       
        $rules=[
            'abstrak_file'=>'required|mimes:pdf|max:5000',           
            'full'=>'required|mimes:pdf|max:10000',
            'judul'=>'required',
            'nama'=>'required',
            'nim'=>'required',
            'program'=>'required',
            'abstrak_text'=>'required',
            'tgl_terbit'=>'required',
        ];
        $messages=[
            'abstrak_file.required'=>'File abstrak tidak boleh kosong',
            'abstrak_file.mimes'=>'Format tidak valid, pilih file PDF',
            'abstrak_file.max'=>'File tidak boleh lebih dari 5MB',
            'full.required'=>'File kesimpilan/saran tidak boleh kosong',
            'full.mimes'=>'Format tidak valid, pilih file PDF',
            'full.max'=>'File tidak boleh lebih dari 10MB',
            'judul.required'=>'Judul masih kosong',
            'nama.required'=>'Nama masih kosong',
            'nim.required'=>'NIM masih kosong',
            'program.required'=>'Program studi masih kosong',
            'abstrak_text.required'=>'Teks abstrak masih kosong',
            'tgl_terbit.required'=>'Tanggal terbit masih kosong'
        ];

        $validator = Validator::make($request->all(),$rules,$messages);
        $skripsi=new \App\Skripsi();
        if($validator->fails()){
            return redirect()->back()->withErrors($validator)->withInput();
        }else {
            $destionation = public_path() . '/file/skripsi';           
            if ($request->hasFile('abstrak_file')) {
                $fileabstrak=$request->file('abstrak_file');               
                $abstrakname='abstrak-'.$request->nim.'-'.\Carbon\Carbon::parse($request->tgl_terbit)->format('Ymd').'.'.$fileabstrak->getClientOriginalExtension();
                $fileabstrak->move($destionation,$abstrakname);
                $skripsi->abstrak_file=$abstrakname;    
            }
            if ($request->hasFile('full')) {
                $filefull=$request->file('full');
               
                $fullname='full-'.$request->nim.'-'.\Carbon\Carbon::parse($request->tgl_terbit)->format('Ymd').'.'.$filefull->getClientOriginalExtension();
                $filefull->move($destionation,$fullname);
                $skripsi->full=$fullname;    
            }
            $skripsi->judul=$request->judul;
            $skripsi->nama=$request->nama;
            $skripsi->nim=$request->nim;
            $skripsi->program=$request->program;
            $skripsi->pembimbing1=$request->pembimbing1;
            $skripsi->nidn1=$request->nidn1;
            $skripsi->pembimbing2=$request->pembimbng2;
            $skripsi->nidn2=$request->nidn2;
            $skripsi->abstrak_text=$request->abstrak_text;
            $skripsi->tgl_terbit=\Carbon\Carbon::parse($request->tgl_terbit)->format('Y-m-d');
            $skripsi->save();
            Session::flash('alert-success', 'Data berhasil ditambahkan');
            return redirect('admin/fasilitas/repos/skripsi');
        }
        
    }
    public function skripsi(Request $request){
            return view('fasilitas.skripsi');
    }
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
