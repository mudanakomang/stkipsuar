<?php

namespace App\Http\Controllers;

use App\GeneralSettings;
use App\Kalender;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Session;

class KalenderController extends Controller
{
    public function download(){
        $general=GeneralSettings::find(1);
        $ts=Carbon::createFromFormat('Y-m-d',$general->ta_start)->format('Y');
        $te=Carbon::createFromFormat('Y-m-d',$general->ta_end)->format('Y');
        $name='Kalender Akademik Tahun Ajaran '.$ts.' - '.$te.'.pdf' ;
        $path= public_path() . '/file/kalender';
        return response()->download($path.'/'.$name);
    }
    public function upload(Request $request){
        $general=GeneralSettings::find(1);
        $ts=Carbon::createFromFormat('Y-m-d',$general->ta_start)->format('Y');
        $te=Carbon::createFromFormat('Y-m-d',$general->ta_end)->format('Y');
        $messages=array(
            'file.mimes'=>'Format tidak valid',
        );
        $rules=array(
            'file'=>"required|mimes:pdf|max:1000"
        );
        if($request->hasFile('file')){
          $validator=Validator::make($request->all(),$rules,$messages);
          if(!$validator->fails()){
              $file = $request->file('file');
              $destionation = public_path() . '/file/kalender';

              $name = 'Kalender Akademik Tahun Ajaran '.$ts.' - '.$te.'.' . $file->getClientOriginalExtension();
              $file->move($destionation, $name);
              Session::flash('alert-success', 'File berhasil diupload');
              return redirect()->back();
          } else{
              return redirect()->back()->withErrors($validator)->withInput();
          }
        }
    }
    public function update(Request $request){
        $id=$request->id;
        $messages=array(
            'title.required'=>'Judul harus diisi',
        );
        $rules=array(
            'title'=>'required',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        if(!$validator->fails()){
            $kal=Kalender::find($id);
            $kal->title=$request->title;
            $kal->start=$request->start;
            $kal->end=$request->end;
            $kal->color=$request->color;
            $kal->save();
            Session::flash('alert-success', 'Data berhasil diupdate');
            return redirect()->back();
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    public function index(){
        $ta=GeneralSettings::find(1);
        $ta_start=Carbon::createFromFormat('Y-m-d',$ta->ta_start)->format('Y-m-d H:i:s');
        $ta_end=Carbon::createFromFormat('Y-m-d',$ta->ta_end)->format('Y-m-d H:i:s');
        $data=Kalender::whereBetween('start',[$ta_start,$ta_end])
            ->get();
        $data=json_encode($data);

        return view('kalender.index')->with(compact('data'));
    }
    public function admin(){
        $ta=GeneralSettings::find(1);
        $ta_start=Carbon::createFromFormat('Y-m-d',$ta->ta_start)->format('Y-m-d H:i:s');
        $ta_end=Carbon::createFromFormat('Y-m-d',$ta->ta_end)->format('Y-m-d H:i:s');
        $data=Kalender::whereBetween('start',[$ta_start,$ta_end])
            ->get();
        $data=json_encode($data);
        return view('admin.akademik.kalender.index')->with(compact('data'));
    }

    public function create(Request $request){
        $messages=array(
            'title.required'=>'Judul harus diisi',
            'start.required'=>'Tanggal mulai tidak boleh kosong',
        );
        $rules=array(
          'title'=>'required',
            'start'=>'required',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        if(!$validator->fails()){
            $kal=new Kalender();
            $kal->title=$request->title;
            $kal->start=$request->start;
            if (empty($request->end)){
                $kal->allday='true';
            }else{
                $kal->end=$request->end;
                $kal->allday='false';
            }
           if(empty($request->color)){
                $kal->color='#8c8c8c';
           }else{
               $kal->color=$request->color;
           }
            $kal->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect()->back();

        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }

    public function hapus($id){
        Kalender::destroy($id);
        Session::flash('alert-success', 'Even berhasil dihapus');
        return redirect()->back();
    }
}
