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
               <h2>Upload File</h2>
           </div>

       </div>
        {!! Form::model($dosen,['action'=>['DosenController@uploadFiles','id'=>$dosen->id],'class'=>'form-horizontal','files'=>'true','enctype'=>'multipart/form-data']) !!}
        
        <div class="form-group">
            {!! Form::label('name', 'Nama File', ['class' => 'col-md-2 control-label'] )  !!}
              <div class="col-md-4">
              {!!  Form::text('name','', ['class' => 'form-control' ]) !!}
                  <span class="text-danger">{{ $errors->first('name') }}</span>
              </div>
        </div>
        <div class="form-group">
            {!! Form::label('filename','File',['class'=>'col-sm-2 control-label']) !!}
            <div class="col-sm-8">
                {!! Form::file('filename') !!}
                <span class="text-danger">{{ $errors->first('filename') }}</span>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-4 col-md-offset-2">
                {!! Form::submit('Submit', ['class' => 'btn btn-lg btn-info pull-left'] ) !!}
            </div>
        </div>

        {!! Form::close() !!}
        
          <div class="panel-default">
               <h2>List File</h2>
           </div>
           <table id="file" class="display" width="100%" cellspacing="0">
                    <thead>
                    <th>No</th>
                    <th>File Name</th>
                    <th>Tanggal Upload</th>
                    <th>Manage</th>
                    </thead>
                    <tbody>
                    @foreach($dosen->files as $key=>$value)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td><a href="{{ asset(url('public/file/dosen/').'/'.$dosen->id.'/'.$value->filename) }}">{{$value->filename}}</a></td>
                            <td> {{ \Carbon\Carbon::parse($value->created_at)->format('d M Y') }}</td>
                            <td><a href="{{ url('dosen/files/'.$value->id.'/hapus') }}" onclick="return confirm('Apakah Anda yakin menghapus konten ini?');">Hapus</a></td>
                        </tr>

                    @endforeach
                    </tbody>
                </table>
                <br>

    </div>
</div>

@endsection
@section('js')
  <script type="application/javascript">
                $(document).ready(function () {
                    $('#file').DataTable();
                });
            </script>
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