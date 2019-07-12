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
               <h2>Pengaturan Umum</h2>
           </div>
       </div>
        {!! Form::open(['url'=>'general/update','class'=>'form-horizontal']) !!}
                <div class="form-group">
                    {!! Form::label('nama', 'Nama Instansi', ['class' => 'col-md-2 control-label'] )  !!}
                    <div class="col-md-4">
                        {!!  Form::text('nama',$general->nama, ['class' => 'form-control' ]) !!}
                    </div>
                </div>
        <div class="form-group">
            {!! Form::label('alamat1', 'Alamat Baris #1', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('alamat1',$general->alamat1, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('alamat2', 'Alamat Baris #2', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('alamat2',$general->alamat2, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('alamat3', 'Alamat Baris #3', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('alamat3',$general->alamat3, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('', 'Periode Tahun Ajaran', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-2 ">
                {!!  Form::text('start',\Carbon\Carbon::parse($general->ta_start)->format('M Y'), ['class' => 'form-control','id'=>'datetimepicker1' ]) !!}
            </div>
            <div class="col-md-2 ">
                {!!  Form::text('end',\Carbon\Carbon::parse($general->ta_end)->format('M Y'), ['class' => 'form-control','id'=>'datetimepicker2' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('telp', 'Telepon', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('telp',$general->telp, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('email', 'Email', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('email',$general->email, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('fb', 'Facebook', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('fb',$general->fb, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('twitter', 'Twitter', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('twitter',$general->twitter, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('gplus', '+Google', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('gplus',$general->gplus, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('maps', 'Maps', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('maps',$general->maps, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('youtube', 'Youtube', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('youtube',$general->youtube, ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-2">
                {!! Form::submit('Submit', ['class' => 'btn btn-lg btn-info pull-left'] ) !!}
            </div>
        </div>

        {!! Form::close() !!}
    </div>
</div>

@endsection
@section('js')
    <script type="text/javascript">
        $("#datetimepicker1").datetimepicker({
            startView:3,
            minView:3,
            autoclose:true,
            format:'M yyyy'
        });
        $("#datetimepicker2").datetimepicker({
            startView:3,
            minView:3,
            autoclose:true,
            format:'M yyyy'
        });
    </script>
    @endsection