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
                        <h3>Kegiatan STKIP Suar Bangli</h3>
                    </header>
              @foreach($kegiatan as $value)    
             <div class="masonry-grid-item no-padding">

                                    <article class="content-box box-img bg-light box-clickable media">
                                         
                                        <div class="box-body media">
                                           
                                     
                                           @if(!empty($foto[0][0]->gambar))
                                            <div class="media-left visible-xs no-padding margin-bottom-10">
                                                <img class="img-responsive media-object borderthumb" src="{{url('public/img/kegiatan').'/'.$value->id.'/'.$foto[0][0]->gambar}}" alt="{{$value->nama}}" style="width: 100%;height: auto; ">
                                            </div>

                                            <div style="float:left; margin-right: 10px;" class="media-left hidden-xs">
                                                <img class="media-object borderthumb" src="{{url('public/img/kegiatan').'/'.$value->id.'/'.$foto[0][0]->gambar}}" alt="{{$value->nama}}" width="190" height="120">
                                            </div>
                                            @endif
                                           

                                            <div class="media-body">
                                                
                                                <h3>
                                                    <a href="{{url('kegiatan/detail').'/'.$value->id}}">{{$value->nama}}</a>
                                                </h3>

                                                <ul class="list-inline small">
                                                    <li>
                                                        <i class="fa fa-calendar"></i>
                                                         {{ \Carbon\Carbon::parse($value->tgl)->format('d M Y') }}
                                                         </li>
                                                    <li>

                                                    <li style="margin-top: 5px;">

                                                         <p>{!! strip_tags(substr($value->keterangan ,0,400 ),'<p><a>') !!}  <a href="{{url('kegiatan/detail').'/'.$value->id}}"><i>Selengkapnya...</i></a></p>
                                                    
                                                            <span></span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div> <!-- .box-body -->

                                    </article> <!-- .content-box -->
                                </div>
                  
                        @endforeach
                       
                        {{ $kegiatan->appends(['sort' => 'created_at'])->links() }}
                       
                      
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
     