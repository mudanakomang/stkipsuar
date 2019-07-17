<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    $sliders=DB::table('sliders')
        ->where('status','=','1')
        ->orderBy('created_at','desc')
        ->limit(3)
        ->get();
    return view('layouts.main')->with(compact('sliders'));
});
Route::get('beranda',function(){
    return redirect('/');
});
Route::get('program-studi/p/{section}','ProgramStudi@section');
Route::get('profil/p/{section}','ProfilController@section');
Route::get('fasilitas/f/{section}','FasilitasController@section');
Route::get('fasilitas/f/repos/skripsi','FasilitasController@skripsi');
Route::post('fasilitas/f/repos/skripsi','FasilitasController@skripsi');
Route::get('fasilitas/f/repos/skripsi/arsip/{tahun}','FasilitasController@arsip');
Route::get('akademik/kalender-akademik','KalenderController@index');
Route::get('akademik/kalender-akademik/download','KalenderController@download');
Route::get('akademik/pedoman-akademik','PedomanController@index');
Route::get('akademik/pedoman-akademik/download','PedomanController@download');
Route::get('penelitian/penelitian-pengabdian-masyarakat','PenelitianController@index');
Route::get('pelatihan/lembaga-pelatihan-bits','PelatihanController@index');
Route::get('pelatihan/prodi-bits','PelatihanController@prodi');
Route::get('berita','BeritaController@allBerita');
Route::get('berita/detail/{id}','BeritaController@detailBerita');
Route::get('agenda','AgendaController@allAgenda');
Route::get('agenda/detail/{id}','AgendaController@detailAgenda');
Route::get('pengumuman','PengumumanController@allPengumuman');
Route::get('pengumuman/detail/{id}','PengumumanController@detailPengumuman');
Route::get('galeri','GaleriController@index');
Route::get('alumni','AlumniController@index');
Route::get('alumni/periode/{id}','AlumniController@byperiode');
Route::get('alumni/jurusan/{id}','AlumniController@byjurusan');
Route::get('kegiatan','KegiatanController@index');
Route::get('kegiatan/detail/{id}','KegiatanController@detail');
Route::get('mahasiswa-baru/pendaftaran','PendaftaranController@pendaftaran');
Route::get('mahasiswa-baru/pendaftaran/cek/{id}','PendaftaranController@cek');
Route::get('mahasiswa-baru/pendaftaran/nomor/{id}','PendaftaranController@pendaftaran1');
Route::post('mahasiswa-baru/pendaftaran','PendaftaranController@pendaftaran1Store');


Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');
Route::group(['middleware'=>['auth','admin']],function (){

        Route::get('/dosen/profil/{id}','DosenController@profilDosen');
        Route::get('admin/dosen/{id}/files','DosenController@fileDosen');
        Route::get('/admin', 'AdminController@index');
        Route::post('/general/update', 'AdminController@update');
        Route::get('/admin/content/slider', 'AdminController@slider');
        Route::get('/slider/add', ['as' => 'addSlider', 'uses' => 'AdminController@sliderAdd']);
        Route::post('/slider/store', ['as' => 'slider.store', 'uses' => 'AdminController@sliderStore']);
        Route::get('/admin/content/slider/{id}/edit', 'AdminController@edit');
        Route::post('/slider/update/{id}')->uses('AdminController@sliderUpdate')->name('slider.update');
        Route::get('admin/content/slider/{id}/hapus', 'AdminController@hapus');
        Route::resource('profil', 'ProfilController');
        Route::post('profil/edit', 'ProfilController@editprofil');
        Route::get('admin/profil/{id}', 'ProfilController@getProfil');
        Route::get('admin/program-studi/{id}', 'ProgramStudi@getProgram');
        Route::post('admin/program-studi/edit', 'ProgramStudi@edit');
        Route::get('admin/fasilitas/{id}', 'FasilitasController@getFasilitas');
        Route::post('admin/fasilitas/edit', 'FasilitasController@edit');
        Route::get('admin/fasilitas/repos/skripsi','FasilitasController@admSkripsi');
        Route::get('admin/fasilitas/repos/skripsi/add','FasilitasController@admSkripsiAdd');
        Route::get('admin/fasilitas/repos/skripsi/edit/{id}','FasilitasController@admSkripsiEdit');
        Route::post('admin/fasilitas/repos/skripsi/store','FasilitasController@storeSkripsi');
        Route::post('admin/fasilitas/repos/skripsi/{id}/update','FasilitasController@skripsiUpdate');
        Route::get('admin/fasilitas/repos/skripsi/delete/{id}','FasilitasController@deleteSkripsi');
        Route::get('admin/akademik/kalender-akademik', 'KalenderController@admin');
        Route::post('admin/kalender/tambah', 'KalenderController@create');
        Route::post('admin/akademik/kalender/hapus/{id}', 'KalenderController@hapus');
        Route::post('admin/kalender/update/{id}', 'KalenderController@update');
        Route::post('admin/kalender/upload', 'KalenderController@upload');
        Route::get('admin/akademik/pedoman-akademik/{id}', 'PedomanController@getPedoman');
        Route::post('admin/akademik/pedoman/update/{id}', 'PedomanController@update');
        Route::get('admin/penelitian/penelitian-pengabdian-masyarakat', 'PenelitianController@getPenelitian');
        Route::post('admin/penelitian/update', 'PenelitianController@update');
        Route::get('admin/pelatihan/lembaga-pelatihan-bits', 'PelatihanController@getPelatihan');
        Route::get('admin/pelatihan/prodi-bits','PelatihanController@getProdi');
        Route::get('admin/pelatihan/bits/add','PelatihanController@addProdi');
        Route::get('admin/pelatihan/bits/{id}/edit','PelatihanController@editProdi');
        Route::get('admin/pelatihan/bits/{id}/hapus','PelatihanController@hapusProdi');
        Route::post('admin/pelatihan/bits/store',['as'=>'prodibits.store','uses'=>'PelatihanController@prodiStore']);
        Route::post('admin/pelatian/bits/{is}/update','PelatihanController@prodiUpdate');
        Route::post('admin/pelatihan/pelatihan-bits/update', 'PelatihanController@updatePelatihan');
        Route::get('admin/dosen','DosenController@dosen');
        Route::get('admin/dosen/add', 'DosenController@dosenAdd');
        Route::get('admin/dosen/{id}/edit', 'DosenController@editDosen');
        Route::post('admin/dosen/store', 'DosenController@dosenStore');
        Route::post('admin/dosen/{id}/update', 'DosenController@dosenUpdate');
        Route::get('admin/dosen/{id}/hapus', 'DosenController@deleteDosen');
        Route::get('admin/galeri','GaleriController@indexAdmin');
        Route::get('admin/galeri/add','GaleriController@add');
        Route::get('admin/galeri/{id}/edit','GaleriController@edit');
        Route::get('admin/galeri/{id}/hapus','GaleriController@hapus');
        Route::post('admin/galeri/store','GaleriController@galeriStore');
        Route::post('admin/galeri/{id}/update','GaleriController@galeriUpdate');
        Route::get('/admin/logout',function (){
            Auth::logout();
            return redirect('/');
        });
        Route::get('admin/berita','BeritaController@getBerita');
        Route::get('admin/berita/add','BeritaController@beritaAdd');
        Route::post('admin/berita/store',['as'=>'berita.store','uses'=>'BeritaController@beritaStore']);
        Route::post('admin/berita/update/{id}',['as'=>'berita.update','uses'=>'BeritaController@beritaUpdate']);
        Route::get('admin/berita/{id}/edit','BeritaController@beritaEdit');
        Route::get('admin/berita/{id}/hapus','BeritaController@beritaHapus');
        Route::get('admin/agenda','AgendaController@getAgenda');
        Route::get('admin/agenda/add','AgendaController@agendaAdd');
        Route::post('admin/agenda/store',['as'=>'agenda.store','uses'=>'AgendaController@agendaStore']);
        Route::post('admin/agenda/update/{id}',['as'=>'agenda.update','uses'=>'AgendaController@agendaUpdate']);
        Route::get('admin/agenda/{id}/edit','AgendaController@agendaEdit');
        Route::get('admin/agenda/{id}/hapus','AgendaController@agendaHapus');
        
        Route::get('admin/pengumuman','PengumumanController@getPengumuman');
        Route::get('admin/pengumuman/add','PengumumanController@pengumumanAdd');
        Route::post('admin/pengumuman/store',['as'=>'pengumuman.store','uses'=>'PengumumanController@pengumumanStore']);
        Route::post('admin/pengumuman/update/{id}',['as'=>'pengumuman.update','uses'=>'PengumumanController@pengumumanUpdate']);
        Route::get('admin/pengumuman/{id}/edit','PengumumanController@pengumumanEdit');
        Route::get('admin/pengumuman/{id}/hapus','PengumumanController@pengumumanHapus');
        Route::get('admin/akademik/ukm/{id}','UkmController@getUkm');
        Route::get('admin/alumni','AlumniController@getAlumni');
        Route::get('admin/alumni/template','AlumniController@download');
        Route::post('admin/alumni/upload','AlumniController@import');
        Route::post('admin/alumni/hapus','AlumniController@hapus');
        Route::get('admin/kegiatan','KegiatanController@getKegiatan');
        Route::get('admin/kegiatan/add','KegiatanController@addKegiatan');
        Route::get('admin/kegiatan/{id}/edit','KegiatanController@kegiatanEdit');
        Route::post('admin/kegiatan/update/{id}',['as'=>'kegiatan.update','uses'=>'KegiatanController@kegiatanUpdate']);
        Route::post('admin/kegiatan/store',['as'=>'kegiatan.store','uses'=>'KegiatanController@kegiatanStore']);
        Route::get('admin/kegiatan/{id}/hapus','KegiatanController@kegiatanHapus');
        Route::get('/admin/kegiatan/picture_add/{id}','KegiatanController@addPic');
        Route::post('/admin/kegiatan/foto/store','KegiatanController@fotoStore');
        Route::get('admin/kegiatan/foto/edit/{id}','KegiatanController@fotoEdit');
        Route::post('admin/kegiatan/foto/update/{id}','KegiatanController@fotoUpdate');
        Route::post('admin/kegiatan/foto/hapus','KegiatanController@hapusFoto');


});
Route::group(['middleware'=>['auth','dosen']],function (){
   Route::get('/dosen','DosenController@index')->name('dosen');
   Route::get('/profil','DosenController@index');
   Route::post('dosen/update/{id}','DosenController@updateDosen');
   Route::get('dosen/password','DosenController@password');
   Route::post('dosen/password/reset/{id}','DosenController@resetPassword');
   Route::get('dosen/files','DosenController@files');
   Route::post('dosen/files/upload/{id}','DosenController@uploadFiles');
   Route::get('dosen/files/{id}/hapus','DosenController@hapus');
   Route::get('/dosen/logout',function (){
       Auth::logout();
       return redirect('/');
   });
});

Route::get('checklogin','CheckLoginController@check');
Route::get('makecontroller',function(){
    $code=Artisan::call('make:controller',['name'=>'AgendaController']);
    print_r($code);
});
Route::get('testing',function(){
  $user=\App\FileUser::first();
  dd($user->user);
});
