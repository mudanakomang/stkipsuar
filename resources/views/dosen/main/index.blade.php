@extends('layouts.master')
@section('navbar')
@include('dosen._navbar')
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
               <h2>Profil Dosen {{ Auth::user()->name}}</h2>
           </div>

       </div>
        {!! Form::model($dosen,['action'=>['DosenController@updateDosen','id'=>$dosen->id],'class'=>'form-horizontal','files'=>'true']) !!}
        @if(!empty($dosen->avatar))
        <div class="form-group">
            {!! Form::label('','Foto',['class'=>'col-sm-2 control-label']) !!}
            <div class="col-sm-8">
              <img src="{{ asset('public/img/dosen').'/'.$dosen->avatar}}" alt="{{$dosen->name}}" width="100px;">
            
            </div>
        </div>
        @endif
        <div class="form-group">
            {!! Form::label('avatar','Foto',['class'=>'col-sm-2 control-label']) !!}
            <div class="col-sm-8">
                {!! Form::file('avatar') !!}
                <span class="text-danger">{{ $errors->first('avatar') }}</span>
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('nik', 'ID', ['class' => 'col-md-2 control-label'] )  !!}
              <div class="col-md-4">
              {!!  Form::text('nik',$dosen->nik, ['class' => 'form-control' ]) !!}
                  <span class="text-danger">{{ $errors->first('nik') }}</span>
              </div>
        </div>
        <div class="form-group">
            {!! Form::label('name', 'Nama Dosen', ['class' => 'col-md-2 control-label'] )  !!}
              <div class="col-md-4">
              {!!  Form::text('name',$dosen->name, ['class' => 'form-control' ]) !!}
                  <span class="text-danger">{{ $errors->first('name') }}</span>
              </div>
        </div>
        <div class="form-group">
            {!! Form::label('alamat', 'Alamat', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('alamat',$dosen->alamat, ['class' => 'form-control' ]) !!}
                <span class="text-danger">{{ $errors->first('alamat') }}</span>
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('nomorhp', 'No. HP', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('nomorhp',$dosen->nomorhp, ['class' => 'form-control' ]) !!}
                <span class="text-danger">{{ $errors->first('nomorhp') }}</span>
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('tmpt_lahir', 'Tempat Lahir', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('tmpt_lahir',$dosen->tmpt_lahir, ['class' => 'form-control' ]) !!}
                <span class="text-danger">{{ $errors->first('tmpt_lahir') }}</span>
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('tgl_lahir', 'Tanggal Lahir', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('tgl_lahir',\Carbon\Carbon::parse($dosen->tgl_lahir,'Asia/Makassar')->format('d M Y'), ['class'=>'col-md-2 form-control date-date ','id'=>'datetimepicker1','readonly' ]) !!}
                <span class="text-danger">{{ $errors->first('tgl_lahir') }}</span>
            </div>
        </div>

        <div class="form-group">
            {!! Form::label('email', 'Email', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::text('email',$dosen->email, ['class' => 'form-control' ]) !!}
                <span class="text-danger">{{ $errors->first('email') }}</span>
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
            format: "dd MM yyyy",
            autoclose: true,
            todayBtn: true,
            pickerPosition: "bottom-left",
            minView:3,
        });
    </script>
    @endsection