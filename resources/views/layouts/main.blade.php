@extends('layouts.master')
@section('navbar')
    @include('layouts._navbar')
    @endsection
@section('slider')
@include('layouts._slider')
@endsection

@section('main-page')
<div class="background-white">
<div class="container">
<div class="col-md-12">

<h1 class="text-center">Selamat Datang Di STKIP SUAR BANGLI</h1>
<br>
<br>
    <h2 class="my-4">Berita

    </h2>
    <div class="row">
        @foreach (\App\Berita::orderBy('created_at','desc')->take(3)->get() as $key => $value)


            <div class="col-lg-4 col-sm-6 masonry-grid-item no-padding">

                <article class="content-box box-img bg-light box-clickable media">
                    <div class="box-body media">
                       

                       
                               @if(!empty($value->gambar))
                                            <div class="media-left visible-xs no-padding margin-bottom-10">
                                                <img class="img-responsive media-object borderthumb" src="{{url('public/img/berita').'/'.$value->gambar}}" alt="{{$value->judul}}" style="width: 100%;height: auto; ">
                                            </div>

                                            <div style="float:top; margin-right: 10px;" class="media-left hidden-xs">
                                                <img class="media-object borderthumb" src="{{url('public/img/berita').'/'.$value->gambar}}" alt="{{$value->judul}}" width="190" height="120">
                                            </div>
                                @endif
                            <h3 style="word-wrap:break-word;">
                                <a href="{{url('berita/detail').'/'.$value->id}}">{{$value->judul}}</a>
                            </h3>

                            <ul class="list-inline small">
                                <li>
                                    <i class="fa fa-calendar"></i>
                                    {{ \Carbon\Carbon::parse($value->tglterbit)->format('d M Y') }}
                                </li>
                                <li>

                                <li style="margin-top: 5px;">

                                    <p>{!! strip_tags(substr($value->isi ,0,400 ),'<p><a>') !!}  <a href="{{url('berita/detail').'/'.$value->id}}"><i>Selengkapnya...</i></a></p>

                                    <span></span>
                                    </a>
                                </li>
                            </ul>
                       
                    </div> <!-- .box-body -->

                </article> <!-- .content-box -->
            </div> <!-- .masonry-grid-item -->
        @endforeach
            </div>
            <br>
            <a class="btn btn-info" href="{{ url('berita')}}">Semua Berita<i class="fa fa-arrow-right"></i></a>
            <hr>
              <h2 class="my-4">Agenda</h2>
            <div class="row">
            @foreach (\App\Agenda::orderBy('created_at','desc')->take(3)->get() as $key => $value)
                               <div class="col-lg-4 col-sm-6 masonry-grid-item no-padding">

                                    <article class="content-box box-img bg-light box-clickable media">
                                        <div class="box-body media">
                                           
                                         
                                            @if(!empty($value->gambar))
                                            <div class="media-heading visible-xs no-padding margin-bottom-10">
                                                <img class="img-responsive media-object borderthumb" src="{{url('public/img/agenda').'/'.$value->gambar}}" alt="{{$value->judul}}" style="width: 100%;height: auto; ">
                                            </div>

                                            <div style="float:top; margin-right: 5px;" class="media-left hidden-xs">
                                                <img class="media-object borderthumb" src="{{url('public/img/agenda').'/'.$value->gambar}}" alt="{{$value->judul}}" width="190" height="120">
                                            </div>
                                            @endif
                                                <h3 style="word-wrap:break-word;">
                                                    <a href="{{url('agenda/detail').'/'.$value->id}}">{{$value->judul}}</a>
                                                </h3>
                                                  <i class="fa fa-calendar"></i>
                                                         {{ \Carbon\Carbon::parse($value->tgl)->format('d M Y') }}
                                                        <span></span>               
                                               
                                                        <p style=" word-wrap:break-word;word-break:break-word;">{!! strip_tags(substr(nl2br($value->isi) ,0,500 ),'<br>') !!}  <a href="{{url('agenda/detail').'/'.$value->id}}"><i>Selengkapnya...</i></a></p>
                                                    <span></span>
                                                
                                        
                                        </div> <!-- .box-body -->
                                    </article> <!-- .content-box -->
                                </div> <!-- .masonry-grid-item -->
               @endforeach
                </div>
                <br>
                 <a class="btn btn-info" href="{{ url('agenda')}}">Semua Agenda<i class="fa fa-arrow-right"></i></a>
            <hr>
            <h2 class="my-4">Pengumuman</h2>
            <div class="row">
            @foreach (\App\Pengumuman::orderBy('created_at','desc')->take(3)->get() as $key => $value)
                               <div class="col-lg-4 col-sm-6 masonry-grid-item no-padding">

                                    <article class="content-box box-img bg-light box-clickable media">
                                        <div class="box-body media">
                                           
                                         
                                            @if(!empty($value->gambar))
                                            <div class="media-heading visible-xs no-padding margin-bottom-10">
                                                <img class="img-responsive media-object borderthumb" src="{{url('public/img/pengumuman').'/'.$value->gambar}}" alt="{{$value->judul}}" style="width: 100%;height: auto; ">
                                            </div>

                                            <div style="float:top; margin-right: 5px;" class="media-left hidden-xs">
                                                <img class="media-object borderthumb" src="{{url('public/img/pengumuman').'/'.$value->gambar}}" alt="{{$value->judul}}" width="190" height="120">
                                            </div>
                                            @endif
                                                <h3 style="word-wrap:break-word;">
                                                    <a href="{{url('pengumuman/detail').'/'.$value->id}}">{{$value->judul}}</a>
                                                </h3>
                                                  <i class="fa fa-calendar"></i>
                                                         {{ \Carbon\Carbon::parse($value->tgl)->format('d M Y') }}
                                                        <span></span>               
                                               
                                                        <p style=" word-wrap:break-word;word-break:break-word;">{!! strip_tags(substr(nl2br($value->isi) ,0,500 ),'<br>') !!}  <a href="{{url('pengumuman/detail').'/'.$value->id}}"><i>Selengkapnya...</i></a></p>
                                                    <span></span>
                                                
                                        
                                        </div> <!-- .box-body -->
                                    </article> <!-- .content-box -->
                                </div> <!-- .masonry-grid-item -->
               @endforeach
                </div>
                <br>
             <a class="btn btn-info" href="{{ url('pengumuman')}}">Semua Pengumuman<i class="fa fa-arrow-right"></i></a>
            <hr>
    </div>
</div>
</div>

@endsection
@section('content')
 @include('layouts._content') 
@endsection
@section('js')
 <script src="{{ asset('js/cbpFWTabs.js') }}"></script>
    <script>
        (function() {

            [].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
                new CBPFWTabs( el );
            });

        })();
    </script>
    <script>
        $(document).ready(function() {
            //Events that reset and restart the timer animation when the slides change
            $("#transition-timer-carousel").on("slide.bs.carousel", function(event) {
                //The animate class gets removed so that it jumps straight back to 0%
                $(".transition-timer-carousel-progress-bar", this)
                    .removeClass("animate").css("width", "0%");
            }).on("slid.bs.carousel", function(event) {
                //The slide transition finished, so re-add the animate class so that
                //the timer bar takes time to fill up
                $(".transition-timer-carousel-progress-bar", this)
                    .addClass("animate").css("width", "100%");
            });

            //Kick off the initial slide animation when the document is ready
            $(".transition-timer-carousel-progress-bar", "#transition-timer-carousel")
                .css("width", "100%");
        });
    </script>
    @endsection