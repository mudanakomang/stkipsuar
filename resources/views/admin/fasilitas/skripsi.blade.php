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
               <h2 class="text-center">Skripsi</h2>
           </div>
           <div class="panel-default" style="padding: 5px">
            <a href="{{ url('admin/fasilitas/repos/skripsi/add') }}" class="btn btn-primary btn-lg" >
                Tambah Skripsi </a>
            </div>
            <div class="panel-default" style="padding: 5px">
                  
            <h3>Daftar Skripsi </h3>
            </div>
            <div class="container">
                
                @foreach ($skripsi as $item)
               
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <i style="vertical-align: middle;padding-right: 4px" id=ico class='fa fa-3x fa-file-pdf-o'></i>
                        <span id="text" style="font-size:1.8em;">{{ $item->judul }} |</span> <i> {{ $item->nama }}</i> <br>
                        <span style="padding-top:2px;padding-bottom: 0px"><i>{{\Carbon\Carbon::parse($item->tgl_terbit)->format('d M Y')}}</i></span>
                        <hr style="border-top:1px dashed rgb(100,100,100);">     
                    </div>


                   
                                         
                  
               
                @endforeach
                
             </div>
          

       </div>
       {{ $skripsi->links() }}
        {{--  {!! Form::open(['url'=>'admin/fasilitas/edit','method'=>'post','class'=>'form-horizontal','id'=>'formProfil','files'=>'true']) !!}
        <div class="form-group">
            {!! Form::label('atribut', 'Atribut', ['class' => 'col-md-2 control-label'] )  !!}
            <div class="col-md-4">
                {!!  Form::select('atribut',\App\Fasilitas::pluck('attribute','id'),[$fasilitas->attribute=>$fasilitas->id], ['class' => 'form-control' ]) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('gambar','Gambar',['class'=>'col-sm-2 control-label']) !!}
            <div class="col-sm-4">
                {!! Form::file('gambar',['class'=>'form-control']) !!}
                <span class="text-danger">{{ $errors->first('gambar') }}</span>
            </div>
        </div>

        <div class="form-group">
            {!! Form::label('value','Isi',['class'=>'col-md-2 control-label']) !!}
            <div class="col-md-8">
                {!! Form::textarea('value',$fasilitas->value,['class'=>'form-control','id'=>'deskripsi']) !!}
            </div>
        </div>
            @ckeditor('value', ['height' => 300])
            <div class="form-group">
                {!! Form::label('publishdate','Tanggal Terbit',['class'=>'col-md-2 control-label']) !!}
                <div class="col-md-4">
                    {!! Form::text('publishdate',\Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$fasilitas->publishdate,'Asia/Makassar')->format('Y-m-d'),['class'=>'form-control date-date ','id'=>'datetimepicker1','readonly']) !!}
                </div>
            </div>

        <div class="form-group">
            <div class="col-md-4 col-md-offset-2">
                {!! Form::submit('Submit', ['class' => 'btn btn-lg btn-info pull-left'] ) !!}
            </div>
        </div>



        {!! Form::close() !!}  --}}
    </div>
</div>

@endsection
@section('js')
    {{--  <script>
        $('#atribut').on('change',function () {
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
    </script>  --}}
    @endsection