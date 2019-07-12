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
                        <h3>{{$berita->judul}}</h3>
                    </header>
                   
                    <article class="blog-entries">
                            <article class="meta">
                            <span class="date">
                                <span class="fa fa-calendar"></span>
                                {{\Carbon\Carbon::parse($berita->tglterbit)->format('d M Y')}}
                            </span>
                                <hr>
                            </article>
                        </article>
                        @if(!empty($berita->gambar))
                                            <div class="media-left visible-xs no-padding margin-bottom-10">
                                                <img class="img-responsive thumbnails " src="{{url('public/img/berita').'/'.$berita->gambar}}" alt="{{$berita->judul}}" style="width: 100%;height: auto;padding:10px; ">
                                            </div>

                                            <div style=" margin-right: 10px;padding:10px;" class="media-left hidden-xs">
                                                <img class="thumbnails" src="{{url('public/img/berita').'/'.$berita->gambar}}" alt="{{$berita->judul}}" width="100%" >
                                            </div>
                    @endif
                   <article class="text-justify" style="font-size: 13px">
                        {!! $berita->isi !!}
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