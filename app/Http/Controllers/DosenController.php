<?php

namespace App\Http\Controllers;

use App\Role;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;
use Session;
use Auth;
use App\FileUser;

class DosenController extends Controller
{
    public function fileDosen($id){
        $dosen=User::find($id);
        $files=$dosen->files;
        return view('admin.dosen.files',['files'=>$files,'dosen'=>$dosen]);
    }
    public function profilDosen($id){
        $dosen=User::find($id);
        return view('admin.dosen.profil',['dosen'=>$dosen]);
    }
    public function hapusfile(Request $request ,$id){
        $dosen=User::find(Auth::user()->id);
        $file=FileUser::find($id);
        $dosen->files()->detach($file);
        unlink('public/file/dosen/'.$dosen->id.'/'.$file->filename);
        $file->delete();
         Session::flash('alert-success', 'Data berhasil dihapus');
            return redirect('dosen/files');
    }
    public function uploadFiles(Request $request,$id){
    
         $dosen=User::find(Auth::user()->id);
         $files=new FileUser();
         $messages=array(
            'filename.required'=>'File masih kosong',
            'filename.mimes'=>'Tipe file tidak didukung, tipe yang didukung : .xlsx,.doc,.docx dan .pdf',
            'filename.max'=>'Ukuran file tidak boleh lebih dari 1Mb',
        );
        $rules=array(
            'filename'=>'required|mimes:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,zip,xlsx,doc,docx,pdf|max:1000',
            
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        if(!$validator->fails()) {
            if ($request->hasFile('filename')){
                $file = $request->file('filename');
                $destionation = public_path() . '/file/dosen/'.$id;
                $name = $request->name.'-'.Carbon::now('Asia/Makassar')->format('Ymdhis').'.' . $file->getClientOriginalExtension();
                $file->move($destionation, $name);
            }
            $files->filename=$name;
         
            $dosen->files()->save($files);
            
               Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('dosen/files');
        }else{
           
           return redirect()->back()->withErrors($validator)->withInput();
        }
        
    }
    public function files(){
         $dosen=User::find(Auth::user()->id);
         return view('dosen.main.files')->with(compact('dosen'));
    }
    public function index(){
        $dosen=User::find(Auth::user()->id);
        return view('dosen.main.index')->with(compact('dosen'));
    }
    public function password(){
       $dosen=User::find(Auth::user()->id); 
       return view('dosen.main.password')->with(compact('dosen'));
    }
    public function resetPassword(Request $request,$id){
        $dosen=User::find($id); 
        $messages=array(
            'password.confirmed'=>'Password tidak sesuai',
            'password.required'=>'Password masih kosong',
            'password.min'=>'Panjang password minimum 6 karakter',

        );
        $rules=array(
            'password'=>'required|min:6|confirmed',
            
        );
       $validator=Validator::make($request->all(),$rules,$messages);
       if(!$validator->fails()){
           $dosen->password=bcrypt($request->password);
           $dosen->save();
           
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('dosen');
       } else {
           return redirect()->back()->withErrors($validator)->withInput(); 
       }
        

    }
    public function updateDosen(Request $request,$id){
        $dosen=User::find($id);
        $messages=array(
            'name.required'=>'Nama Tidak boleh kosong.',
            'alamat.required'=>'Alamat tidak boleh kosong',
            'tmpt_lahir.required'=>'Tempat lahir tidak boleh kosong',
            'avatar.mimes'=>'Format tidak valid',
            'avatar.max'=>'Gambar tidak boleh lebih dari 500Kb',

        );
        $rules=array(
            'name'=>'required',
            'alamat'=>'required',
            'tmpt_lahir'=>'required',
            'avatar'=>'image|mimes:jpg,jpeg,png,bmp|max:500',

        );

        $validator=Validator::make($request->all(),$rules,$messages);

        if(!$validator->fails()) {
             if ($request->hasFile('avatar')){
                $file = $request->file('avatar');
                $destionation = public_path() . '/img/dosen';
                $name = Carbon::now('Asia/Makassar')->format('Ymdhis') . '.' . $file->getClientOriginalExtension();
                $file->move($destionation, $name);
                $dosen->avatar=$name;
            }
            $dosen->username=$request->nik;
            $dosen->name = $request->name;
            $dosen->alamat = $request->alamat;
            $dosen->nomorhp=$request->nomorhp;
            $dosen->tmpt_lahir = $request->tmpt_lahir;
            $dosen->tgl_lahir =Carbon::parse($request->tgl_lahir,'Asia/Makassar')->format('Y-m-d');
            $dosen->save();

            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('dosen');
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }


    }
    public function dosen(){
        $dosens = User::whereHas('roles', function($q){
            $q->where('name', 'dosen');
        })->get();
       return view('admin.dosen.index')->with(compact('dosens'));
    }
    public function dosenAdd(){
        $dosen=new User();
        $action='add';
        return view('admin.dosen.adddosen')->with(compact('dosen','action'));
    }
    public function dosenStore (Request $request){

        $messages=array(
            'nik.required'=>'ID Dosen tidak boleh kosong',
            'nik.unique'=>'ID Dosen sudah digunakan',
            'name.required'=>'Nama Dosen tidak boleh kosong',
            'email.required'=>'Email tidak boleh kosong',
            'email.unique'=>'Email sudah digunakan',
            'password.required'=>'Password harus diisi',
            'password.min'=>'Panjang password minimum 6 karakter',
        );
        $rules=array(
            'nik'=>'required|unique:users',
            'name'=>'required',
            'email'=>'required|unique:users',
            'password'=>'required|min:6',
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        if (!$validator->fails()){
            $dosen=new User();
            $dosen->nik=$request->nik;
            $dosen->name=$request->name;
            $dosen->alamat=$request->alamat;
            $dosen->tmpt_lahir=$request->tmpt_lahir;
            $dosen->tgl_lahir=$request->tgl_lahir;
            $dosen->email=$request->email;
            $dosen->username=$request->nik;
            $dosen->password=bcrypt($request->password);
            $dosen->save();
            $role=Role::where( 'name','=','dosen' )->first();
            $dosen->attachRole($role);

            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('/admin/dosen');
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
    public function deleteDosen($id){
        $dosen=User::find($id);
      $dosen->delete();

        Session::flash('alert-success', 'Dosen berhasil dihapus');
        return redirect('/admin/dosen');
    }

    public function editDosen($id){
        $dosen=User::find($id);
        $action='edit';
        return view('admin.dosen.editdosen')->with(compact('dosen','action'));
    }
    public function dosenUpdate(Request $request,$id){
        $dosen=User::find($id);
        $messages=array(
            'nik.required'=>'ID Dosen tidak boleh kosong',
            'nik.unique'=>'ID Dosen sudah digunakan',
            'name.required'=>'Nama Dosen tidak boleh kosong',
            'email.required'=>'Email tidak boleh kosong',
            'email.unique'=>'Email sudah digunakan',
        );
        $rules=array(
            'nik'=>'required|unique:users,id,'.$id,
            'name'=>'required',
            'email'=>'required|unique:users,id,'.$id,
        );
        $validator=Validator::make($request->all(),$rules,$messages);
        if(!$validator->fails()){
            $dosen->nik=$request->nik;
            $dosen->name=$request->name;
            $dosen->alamat=$request->alamat;
            $dosen->tmpt_lahir=$request->tmpt_lahir;
            $dosen->tgl_lahir=$request->tgl_lahir;
            $dosen->email=$request->email;
            $dosen->username=$request->nik;
            $dosen->save();
            Session::flash('alert-success', 'Data berhasil disimpan');
            return redirect('/admin/dosen');
        } else{
            return redirect()->back()->withErrors($validator)->withInput();
        }
    }
}
