@extends('layouts.master')
@section('navbar')
    @include('layouts._navbar')
@endsection
@section('main-page')
    <div class="bar background-white">
    <div class="container">
        <div class="col-md-12">
            <div class="row">
            <div class="col-md-8">
                <section class="blog-entries">
                    <header>
                        <h3>Pendaftaran Mahasiswa Baru</h3>
                    </header>
                   
                    <p>Bagi calon Mahasiswa/Mahasiswi baru STKIP Suar Bangli, silahkan <i>generate</i> nomor pendaftaran dibawah ini. Nomor akan digunakan dalam proses pendaftaran sampai pendaftaran dinyatakan valid.</p>
                    <div class="alert alert-warning">
                    <p> Simpan dengan baik nomor pendaftran yang Anda dapatkan.</p>
                    </div>
                    <button class="btn btn-md btn-info" id="daftar">Dapatkan Nomor Pendaftaran</button>
                    <p></p>
                    <div id="link">
                        
                    </div>
                      
                    <p>Jika sudah pernah melakuakn pendaftaran atau melanjutkan proses pendaftaran, silahkan masukkan nomor pendaftaran kemudian cek status pendaftaran Anda</p>
                    <div class="alert alert-success">
                       <div class="form-group">
                          <label for="nomordaftar">Nomor Pendaftaran </label>
                          <input type="text" class="form-control" id="nomordaftar">
                        </div>
                        <div class="form-group">
                          <button id="cek" class="btn btn-md btn-info">Cek Status Pendaftaran</button>
                        </div>
                       
                    </div>
             </section>

            </div>
            <div class="col-md-4">
                 @include('layouts._right-pane')
            </div>
            </div>





        </div>
    </div>
    </div>

    @endsection
@section('content')
    @include('layouts._content')
    @endsection
    @section('js')
        <script>
          $(document).ready(function(){
            var parrent=document.getElementById("link");
            
            $('button#daftar').click(function(){
                var no= Math.floor((Math.random() * 100000));
             var html="{{url('mahasiswa-baru/pendaftaran/nomor/')}}";
             html=html+"/"+no;
             $('div#linkdaftar').remove();
             $('div#link').append($('<div class="alert alert-info" id="linkdaftar"><br><h4>Berikut adalah Nomor dan Link pendaftaran Anda </h4><strong><h3>NOMOR : '+no+' (Simpan nomor ini)</h3></strong><br><a class="btn btn-md btn-info" href="'+html+'" >Menuju Halaman Pendaftaran</a></div>'));
           
            });
          });
        </script>
        <script>
            $(document).ready(function(){
               $('#cek').click(function(){
                 var no=$('#nomordaftar').val();
                 var url="{{url('mahasiswa-baru/pendaftaran/cek/')}}";
                 url=url+"/"+no;
                 location.href=url;
               });
            });
        </script>
    @endsection
    
     