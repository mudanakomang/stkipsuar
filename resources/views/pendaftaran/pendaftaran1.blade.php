@extends('layouts.master')
@section('navbar')
    @include('layouts._navbar')
@endsection
@section('main-page')
    <div class="bar background-white">
    <div class="container">
        <div class="col-md-12">
            <div class="row">
            <div class="col-md-12">
                <section class="blog-entries">
                    <header>
                        <h3 class="text-center">Form Pendaftaran Mahasiswa Baru Tahun Ajaran {{\Carbon\Carbon::parse($general->ta_start)->format('Y') .'-'. \Carbon\Carbon::parse($general->ta_end)->format('Y') }}</h3>
                    </header>
                   @include('pendaftaran._form1')
                   
             </section>

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
         <script type="text/javascript">
                 $('.datepick').each(function(){
                     var dateNow = new Date();
                     dateNow.setFullYear( dateNow.getFullYear() - 16 );
                        $(this).datetimepicker({
                            startView:4,
                            minView:2,
                            autoclose:true,
                            format:'d M yyyy',
                            startDate:'1 Jan 1940',
                           defaultdate:dateNow,
                        });
                    });
            
            </script>
            <script>
            $(document).ready(function(){
                 var total=$('.prodi:checked').length;
                $('.prodi').on('change',function(){
                  if(this.checked){
                      total++;
                  }else{
                      total--;
                  }
                  if(total>2 ){
                      alert('Hanya boleh memilih 2 jurusan!');
                      this.checked=false;
                      total--;
                  }
                  console.log(total);
                  }); 
                });
           
           
           
            </script>
    @endsection
    
     