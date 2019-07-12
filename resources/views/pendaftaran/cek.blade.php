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
                        <h3>Cek Status Pendaftaran</h3>
                    </header>
                @if(count($pendaftaran)<=0)
                    <div class="alert alert-danger">
                    <p>Pendaftaran dengan nomor <strong>{{$id}}</strong> tidak ditemukan</p>
                    </div>
                    <p>Silahkan lanjutkan proses pendaftaran dengan mengikuti link berikut</p>
                    <a class="btn btn-md btn-info" href="{{url('mahasiswa-baru/pendaftaran/nomor/').'/'.$id}}">Lanjutkan Pendaftaran</a>
                  @else
                  {{$pendaftaran}}
                  @endif
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
    @endsection
    
     