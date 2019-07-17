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
                <h2 class="text-center">Edit Skripsi </h2>
            </div>
            @include('admin.fasilitas._formskripsi')


        </div>
    </div>

</div>

    @endsection

    @section('js')

    <script type="text/javascript">
        $("#datetimepicker1").datetimepicker({
            
           defaultDate:new Date(),
           startView:2,
           minView:3,
            autoclose: true,
             todayBtn: true,
             format:'d M yyyy',
             localToday: new Date(),
            startDate: new Date(),
           
        });
    </script>

    @endsection