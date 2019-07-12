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
                        <h3>{{$kegiatan->nama}}</h3>
                    </header>
                   
                    <article class="blog-entries">
                            <article class="meta">
                            <span class="date">
                                <span class="fa fa-calendar"></span>
                                {{\Carbon\Carbon::parse($kegiatan->tgl)->format('d M Y')}}
                            </span>
                                <hr>
                            </article>
                        </article>
                    
                     <div class="row text-center text-lg-left" style="padding-bottom:20px;">
                        @foreach($kegiatan->foto as $value)
                        <div class="col-lg-3 col-md-4 col-xs-6" style="height:250px; width:300px;">
                          <a href="{{url('public/img/kegiatan').'/'.$kegiatan->id.'/'.$value->gambar}}" class="d-block mb-4 h-100" rel="prettyPhoto[pp_gal]" title="{{$kegiatan->nama}}">
                            <img class="img-fluid img-thumbnail" src="{{asset('public/img/kegiatan').'/'.$kegiatan->id.'/'.$value->gambar }}" width="400" height="300"  alt="{{$kegiatan->nama}}">
                          </a>
                        </div>
                        @endforeach
                         
                       </div>
               
                   <article class="text-justify" style="font-size: 13px">
                        {!! $kegiatan->keterangan !!}
                   </article>
               
            
             </section>

            </div>
            <div class="col-md-4">
                 @include('layouts._right-pane')
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
        <script>
    $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'light_square',slideshow:6000, autoplay_slideshow:true,social_tools:false});
</script>
    @endsection