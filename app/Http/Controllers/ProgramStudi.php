<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Carbon\Carbon;
use Session;
class ProgramStudi extends Controller
{
    public function section(Request $request){
        $section=str_slug($request->section,'-');
        $programs=\App\ProgramStudi::all();

        foreach ($programs as $program) {
            if(str_slug($program->attribute,'-')==$section) {
                return view('program.index')->with(compact('program'));
            }
        }


    }

    public function getProgram($id){
        $program=\App\ProgramStudi::find($id);
    return view('admin.program.index')->with(compact('program'));
    }

    public function edit(Request $request){
        $profil=\App\ProgramStudi::find($request->atribut);
        $profil->value=$request->value;
        $profil->publishdate=Carbon::createFromFormat('Y-m-d',$request->publishdate);
        $profil->save();
        Session::flash('alert-success', 'Data berhasil diupdate');
        return redirect()->back();
    }
}
