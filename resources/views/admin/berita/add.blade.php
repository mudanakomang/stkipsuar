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
                    <h2 class="text-center">Tambah Berita</h2>
                </div>
            @include('admin.berita._form')


        </div>
    </div>

</div>

    @endsection

    @section('js')

        <script type="text/javascript">
            $("#datetimepicker1").datetimepicker({
                startView:2,
                minView:3,
                autoclose: true,
                todayBtn: true,
                format:'d M yyyy',
                localToday: new Date(),
            });
        </script>
        <script>
            CKEDITOR.config.customConfig="{{ asset('js/custom1.js') }}";
            CKEDITOR.replace(isi);
        </script>

    @endsection