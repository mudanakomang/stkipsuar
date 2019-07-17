@extends('layouts.master')
@section('navbar')
    @include('layouts._navbar')
@endsection
@section('main-page')
    <div class="bar background-white">
    <div class="container">
        <div class="col-md-12">
            <div class="row">
            <div class="col-md-8">
                <section class="blog-entries">


                        <header>
                            <h2> Daftar Skripsi </h2>
                        </header>
                        <div class="panel-default">
                            <h3 class="text-center">Cari</h3>
                            {{ Form::open(['url' => 'fasilitas/f/repos/skripsi','class'=>'form-horizontal',]) }}
                            <div class="form-group">
                                {!! Form::label('program','Program Studi',['class'=>'col-sm-4 control-label']) !!}
                                <div class="col-sm-6">
                                    {!! Form::select('program',[''=>'Pilih Program Studi',
                                                                    'Pendidikan Bahasa dan Sastra Indonesia'=>'Pendidikan Bahasa dan Sastra Indonesia',
                                                                    'Pendidikan Bahasa Inggris'=>'Pendidikan Bahasa Inggris',
                                                                    'Pendidikan Guru Sekolah Dasar'=>'Pendidikan Guru Sekolah Dasar'],null,['class'=>'form-control']) !!}
                                    <span class="text-danger">{{ $errors->first('program') }}</span>
                                </div>
                                
                            </div>
                            <div class="form-group">
                                {!! Form::label('tahun','Tahun',['class'=>'col-sm-4 control-label']) !!}
                                <div class="col-sm-6">
                                    {!! Form::text('tahun',null,['class'=>'form-control','placeholder'=>'Pilih Tahun']) !!}                                   
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 pull-right">
                                    {!! Form::submit('Cari',['class'=>'btn btn-success']) !!}
                                </div>
                             </div>
                            {{ Form::close() }}
                        </div>
                        <hr>
                        @foreach($skripsi as $item)
                        <article class="blog-entries">
                                <i style="vertical-align: middle;padding-right: 4px" id=ico class='fa fa-2x fa-file-pdf-o'></i>
                                <span id="text" style="font-size:1.3em;">{{ $item->judul }}</span>
                            <article class="meta">
                            <span class="date">
                                <span class="fa fa-calendar"></span>
                            {{\Carbon\Carbon::parse($item->tgl_terbit)->format('d M Y') }} | <span class="fa fa-user"> </span> oleh : {{ $item->nama }}
                            </span>
                                <hr>
                            </article>
                        </article>                    
                        @endforeach                        
                </section>
                {{ $skripsi->links() }}

            </div>
            <div class="col-md-4">
                  {{-- Right Pane --}}
                  <div class="sidebar">
                        <aside class="news-small well well-sm" id="news-small" style="padding-bottom:10px;">
                          <header>
                              <h3>Arsip Skripsi</h3>
                          </header> 
                          <div class="section-content">
                           @foreach($tahun as $th)
                          <a href="{{ url('fasilitas/f/repos/skripsi/arsip').'/'.$th->tahun }}"> <p style="font-size:1.2em">{{ $th->tahun }} <i class="fa fa-search fa-2x"></i></p> </a>
                          
                            @endforeach                                 
                           </div><!-- /.section-content -->
                      
                      </aside>
                    
      
      </div>
      
                  {{-- End Right Pane --}}
            </div>
            </div>
        </div>
    </div>
    </div>

    @endsection
@section('content')
   @include('layouts._content')
@endsection
@section('js')
<script type="text/javascript">
    $("#tahun").datetimepicker({
        format: "yyyy",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left",
        startView:4,
        minView:4
    });
</script>  
@endsection