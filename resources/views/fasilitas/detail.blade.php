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
                            <h2> Detail </h2>
                        </header>
                        
                        <hr>
                       
                        <article class="blog-entries">
                           <h5>Judul Skripsi</h5>
                           <i style="vertical-align: middle;padding-right: 4px" id=ico class='fa fa-2x fa-file-pdf-o'></i>
                           <span id="text" style="font-size:1.3em;">  {{ $skripsi->judul }}</span>
                            <article class="meta">                        
                                <span class="date">
                                    <span class="fa fa-calendar"></span>
                                {{\Carbon\Carbon::parse($skripsi->tgl_terbit)->format('d M Y') }} 
                                </span>
                            </article>
                            <hr>
                            <h5>Penulis</h5>
                        <span id="text" style="font-size:1.3em;">  {{ strtoupper($skripsi->nama) }} ({{ $skripsi->nim }})</span>
                            <hr>
                            <h5>Pembimbing I</h5>
                            <span id="text" style="font-size:1.3em;">  {{ strtoupper($skripsi->pembimbing1) }} {{ !empty($skripsi->nidn1) ? "(".$skripsi->nidn1.")": "" }}</span>
                            <hr>
                            <h5>Pembimbing II</h5>
                            <span id="text" style="font-size:1.3em;">  {{ strtoupper($skripsi->pembimbing2) }} {{ !empty($skripsi->nidn2) ? "(".$skripsi->nidn2.")": "" }}</span>
                            <hr>
                            <h5>Abstrak</h5>
                        <pre id="text" style="font-size:1.3em; line-height: normal;font-family:Roboto;border:none" >{{ str_replace('<p>','',str_replace("</p>","",$skripsi->abstrak_text)) }}</pre>
                        <hr>
                        <h5>Download File</h5>
                        <a href="{{ url('fasilitas/f/repos/skripsi/download/abstrak/').'/'.$skripsi->id }}"> <i style="vertical-align: middle;padding-right: 4px" id=ico class='fa fa-2x fa-file-pdf-o'></i>
                        <span id="text" style="font-size:1.3em;"> Abstrak </span></a>
                        <br>
                        <a href="{{ url('fasilitas/f/repos/skripsi/download/full/').'/'.$skripsi->id }}"> <i style="vertical-align: middle;padding-right: 4px" id=ico class='fa fa-2x fa-file-pdf-o'></i>
                        <span id="text" style="font-size:1.3em;"> Skirpsi Full </span></a>
                        </article>                    
                                            
                </section>
               

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