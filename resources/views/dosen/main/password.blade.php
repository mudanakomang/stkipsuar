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
               <h2>Reset Password Dosen {{ Auth::user()->name}}</h2>
           </div>

       </div>
        {!! Form::model($dosen,['action'=>['DosenController@resetPassword','id'=>$dosen->id],'class'=>'form-horizontal','files'=>'true']) !!}
        
        <div class="form-group">
            {!! Form::label('password', 'Password Baru', ['class' => 'col-md-2 control-label'] )  !!}
              <div class="col-md-4">
              {!!  Form::password('password', ['class' => 'form-control' ]) !!}
                  <span class="text-danger">{{ $errors->first('password') }}</span>
              </div>
        </div>
        <div class="form-group">
            {!! Form::label('password_confirmation', 'Konfirmasi Password', ['class' => 'col-md-2 control-label'] )  !!}
              <div class="col-md-4">
              {!!  Form::password('password_confirmation', ['class' => 'form-control' ]) !!}
                  <span class="text-danger">{{ $errors->first('password_confirmation') }}</span>
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