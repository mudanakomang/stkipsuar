<?php

namespace App\Http\Controllers;

use App\Fasilitas;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Session;
use Validator;

class FasilitasController extends Controller
{
    public function admSkripsi(){
        $skripsi=\App\Skripsi::paginate(15);
        return view('admin.fasilitas.skripsi',['skripsi'=>$skripsi]);
    }
    public function admSkripsiAdd(){
        $action='add';
        $skripsi=new \App\Skripsi();
        return view('admin.fasilitas.addskripsi',['action'=>$action,'skripsi'=>$skripsi]);
    }
    public function storeSkripsi(Request $request){
       
        $rules=[
            'abstrak_file'=>'required|mimes:pdf|max:5000',
            'bab1'=>'required|mimes:pdf|max:5000',
            'bab5'=>'required|mimes:pdf|max:5000',
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
            'bab1.required'=>'File pendahuluan tidak boleh kosong',
            'bab1.mimes'=>'Format tidak valid, pilih file PDF',
            'bab1.max'=>'File tidak boleh lebih dari 5MB',
            'bab5.required'=>'File kesimpilan/saran tidak boleh kosong',
            'bab5.mimes'=>'Format tidak valid, pilih file PDF',
            'bab5.max'=>'File tidak boleh lebih dari 5MB',
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
            if ($request->hasFile('bab1')) {
                $filebab1=$request->file('bab1');
               
                $bab1name='pendahuluan-'.$request->nim.'-'.\Carbon\Carbon::parse($request->tgl_terbit)->format('Ymd').'.'.$filebab1->getClientOriginalExtension();
                $filebab1->move($destionation,$bab1name);
                $skripsi->bab1=$bab1name;    
            }
            if ($request->hasFile('bab5')) {
                $filebab5=$request->file('bab5');
               
                $bab5name='kesimpulan-'.$request->nim.'-'.\Carbon\Carbon::parse($request->tgl_terbit)->format('Ymd').'.'.$filebab5->getClientOriginalExtension();
                $filebab5->move($destionation,$bab5name);
                $skripsi->bab5=$bab5name;    
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
