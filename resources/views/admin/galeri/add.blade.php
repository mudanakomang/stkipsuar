@extends('layouts.master')
@section('navbar')
@include('admin._navbar')
@endsection
@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            @foreach (['danger', 'warning', 'success', 'info'] as $msg)

            @if(Session::has('alert-' . $msg))
            <div class="alert alert-{{ $msg }} alert-dismissable">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <p >{{ Session::get('alert-' . $msg) }}</p>
            </div>
            @endif

            @endforeach
            <div class="panel-default">
                <h2 class="text-center">Tambah Foto / Gambar </h2>
            </div>
            @include('admin.galeri._form')


        </div>
    </div>

</div>

    @endsection

    @section('js')



    @endsection