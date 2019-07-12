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
               <h2 class="text-center">Pengaturan UKM</h2>
           </div>
       </div>
        {!! Form::open(['url'=>'admin/akademik/ukm/edit','method'=>'post','class'=>'form-horizontal','id'=>'formProfil','files'=>'true']) !!}
        <div class="form-group">
            {!! Form::label('jenis', 'Jenis', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::select('jenis',\App\Ukm::pluck('jenis','id'),[ucfirst($ukm->jenis)=>$ukm->id], ['class' => 'form-control' ]) !!}
            </div>
        </div>

        <div class="form-group">
            {!! Form::label('keterangan','Keterangan',['class'=>'col-md-2 control-label']) !!}
            <div class="col-md-8">
                {!! Form::textarea('keterangan',$ukm->keterangan,['class'=>'form-control','id'=>'deskripsi']) !!}
            </div>
        </div>
            @ckeditor('keterangan', ['height' => 300])
         <div class="form-group">
            {!! Form::label('gambar','Gambar',['class'=>'col-sm-2 control-label']) !!}
                <div class="col-sm-8">
                {!! Form::file('gambar') !!}
                 <span class="text-danger">{{ $errors->first('gambar') }}</span>
                </div>
        </div>
        @if(!empty($ukm->gambar))

<div class="form-group">
    {!! Form::label('','Gambar',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
      <img src="{{ asset('public/img/ukm').'/'.$ukm->id.'/'.$ukm->gambar}}" alt="{{$ukm->gambar}}" width="150px;">
    
    </div>
</div>
@endif

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
    <script>
        $('#jenis').on('change',function () {
            var id=$(this).val();
            var url=''+id;
            location=url;

        });
    </script>
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