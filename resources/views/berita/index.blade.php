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
                        <h3>Semua Berita</h3>
                    </header>
                  
               @foreach($berita as $key=>$value) 
               @php
               $rand=rand(1,5)
               @endphp
               @if($rand==$key)
               <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="fluid"
     data-ad-layout-key="-cq-1p+66+km-ey"
     data-ad-client="ca-pub-7385784022666300"
     data-ad-slot="2891209577"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
               @endif   
             <div class="masonry-grid-item no-padding">

                                    <article class="content-box box-img bg-light box-clickable media">
                                         
                                        <div class="box-body media">
                                           @if(!empty($value->gambar))
                                            <div class="media-left visible-xs no-padding margin-bottom-10">
                                                <img class="img-responsive media-object borderthumb" src="{{url('public/img/berita').'/'.$value->gambar}}" alt="{{$value->judul}}" style="width: 100%;height: auto; ">
                                            </div>

                                            <div style="float:left; margin-right: 10px;" class="media-left hidden-xs">
                                                <img class="media-object borderthumb" src="{{url('public/img/berita').'/'.$value->gambar}}" alt="{{$value->judul}}" width="190" height="120">
                                            </div>
                                            @endif

                                            <div class="media-body">
                                                
                                                <h3>
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
                                            </div>
                                        </div> <!-- .box-body -->

                                    </article> <!-- .content-box -->
                                </div>
                  
                        @endforeach
                       
                        {{ $berita->appends(['sort' => 'created_at'])->links() }}
            
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