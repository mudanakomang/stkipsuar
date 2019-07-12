<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Agenda;
use Carbon\Carbon;
use Validator;
use Session;
class AgendaController extends Controller
{
    public function getAgenda(){
         $agenda=Agenda::orderBy('created_at','desc')->get();
        return view('admin.agenda.index',['agenda'=>$agenda]);
    }
    
    public function agendaAdd(){
        $action='add';
        $agenda=new Agenda();
        return view('admin.agenda.add')->with(compact('action','agenda'));
    }
    public function agendaStore(Request $request){
        $messages=array(
            'judul.required'=>'Judul tidak boleh kosong',
            'isi.required'=>'Isi tidak boleh kosong',
            'tgl.required'=>'Tanggal terbit tidak boleh kosong',
            'gambar.mimes'=>'Format tidak valid',
            'gambar.max'=>'Gambar Tidak boleh lebih dari 500Kb',
        );
        $rules=array(
            'judul'=>'required',
            'isi'=>'required',
            'tgl'=>'required',
            'gambar'=>'image|mimes:jpg,jpeg,bmp,png|max:500',
        );  
          $validator=Validator::make($request->all(),$rules,$messages);
          $agenda=new Agenda();
           if(!$validator->fails()){
               if ($request->hasFile('gambar')){
                $file = $request->file('gambar');
                $destionation = public_path() . '/img/agenda';
                $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                $file->move($destionation, $name);
                $agenda->gambar=$name;
                }
               $agenda->judul=$request->judul;
               $agenda->isi=$request->isi;
               $agenda->tgl=Carbon::parse($request->tgl)->format('Y-m-d');
               $agenda->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('admin/agenda');
           } else{
                 return redirect()->back()->withErrors($validator)->withInput();
           }
          
    }
    
    public function agendaEdit($id){
      
    
      $action='edit';
      $agenda=Agenda::find($id);
      return view('admin.agenda.edit')->with(compact('action','agenda'));
    }
    public function agendaUpdate(Request $request, $id){
         $messages=array(
            'judul.required'=>'Judul tidak boleh kosong',
            'isi.required'=>'Isi tidak boleh kosong',
            'tgl.required'=>'Tanggal terbit tidak boleh kosong',
            'gambar.mimes'=>'Format tidak valid',
            'gambar.max'=>'Gambar Tidak boleh lebih dari 500Kb',
        );
        $rules=array(
            'judul'=>'required',
            'isi'=>'required',
            'tgl'=>'required',
            'gambar'=>'image|mimes:jpg,jpeg,bmp,png|max:500',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        $agenda=Agenda::find($id);
        $destionation = public_path() . '/img/agenda';
        if (!$validator->fails()){
             if ($request->hasFile('gambar')){
                if ($agenda->gambar!=''){
                    $file = $request->file('gambar');
                    $file->move($destionation, $agenda->gambar);
                }else {
                    $file = $request->file('gambar');
                    $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                    $file->move($destionation, $name);
                    $agenda->gambar = $name;
                }
        }
            $agenda->judul=$request->judul;
            $agenda->isi=$request->isi;
            $agenda->tgl=Carbon::parse($request->tgl)->format('Y-m-d');
            $agenda->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect('admin/agenda');
        }else{
             return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    public function agendaHapus($id){
        $agenda=Agenda::find($id);
        $agenda->delete();
        Session::flash('alert-success', 'Data berhasil dihapus');
        return redirect('admin/agenda');
    }
    public function allAgenda(){
         $agenda=Agenda::orderBy('created_at', 'desc')->paginate(6);
        return view('agenda.index',['agenda'=>$agenda]);
    }
    public function detailAgenda($id){
          $agenda=Agenda::find($id);
        return view('agenda.detail',['agenda'=>$agenda]);
    }
}
