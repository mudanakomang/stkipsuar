<?php

namespace App\Http\Controllers;

use App\Profil;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\GeneralSettings;
use Rensponse;
use Session;

class ProfilController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function section(Request $request){
        $section=str_slug($request->section,'-');
        $profils=Profil::all();

        foreach ($profils as $profil) {
            if(str_slug($profil->attribute,'-')==$section) {
                return view('profil.profil')->with(compact('profil'));
            }
        }


    }


    public function getProfil($id){
        $profil=Profil::find($id);
        return view('admin.profil.index')->with(compact('profil'));


    }
    public function editprofil(Request $request){
        $profil=Profil::find($request->atribut);
        $profil->value=$request->value;
        $profil->publishdate=Carbon::createFromFormat('Y-m-d',$request->publishdate);
        $profil->save();
        Session::flash('alert-success', 'Data berhasil diupdate');
        return redirect()->back();
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
