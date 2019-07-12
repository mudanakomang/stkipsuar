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
                <h2>Edit Dosen</h2>
            </div>
            @include('admin.dosen._form')

        </div>
    </div>

</div>

    @endsection
@section('js')
    <script type="text/javascript">
        $("#datetimepicker1").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            pickerPosition: "bottom-left",
            minView:2,
        });
    </script>
@endsection