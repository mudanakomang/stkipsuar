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
               <h2 class="text-center">Lembaga Pelatihan BITS</h2>
           </div>
       </div>
        {!! Form::open(['url'=>'admin/pelatihan/pelatihan-bits/update','method'=>'post','class'=>'form-horizontal','id'=>'formPenelitian']) !!}
        <div class="form-group">
            {!! Form::label('isi','Isi',['class'=>'col-md-2 control-label']) !!}
            <div class="col-md-8">
                {!! Form::textarea('isi',$pelatihan->isi,['class'=>'form-control','id'=>'deskripsi']) !!}
                <span class="text-danger">{{ $errors->first('isi') }}</span>
            </div>
        </div>
            @ckeditor('value', ['height' => 150])
            <div class="form-group">
                {!! Form::label('publishdate','Tanggal Terbit',['class'=>'col-md-2 control-label']) !!}
                <div class="col-md-4">
                    {!! Form::text('publishdate',\Carbon\Carbon::parse($pelatihan->publishdate,'Asia/Makassar')->format('Y-m-d'),['class'=>'form-control date-date ','id'=>'datetimepicker1','readonly']) !!}
                    <span class="text-danger">{{ $errors->first('publishdate') }}</span>
                </div>
            </div>

        <div class="form-group">
            <div class="col-md-4 col-md-offset-2">
                {!! Form::submit('Submit', ['class' => 'btn btn-lg btn-info pull-left'] ) !!}
            </div>
        </div>
        @ckeditor('deskripsi', ['height' => 300])



        {!! Form::close() !!}
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