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
                        <h3>Alumni STKIP Suar Bangli</h3>
                    </header>
                <div class="col-md-6">
              
                  <div class="text-left">
                      <h5>Pilih Berdasarkan Periode Wisuda</h5>
                  </div>
                    <div class="list-group">
                        @foreach($periode as $key=>$value)
                            <a class="list-group-item list-group-item-action list-group-item-primary" href="{{ url('alumni/periode/').'/'.$value->periode}}">{{$value->periode}}</a>
                        @endforeach
                         {{ $periode->appends(['sort' => 'periode'])->fragment('periode')->links() }}
                    </div>
                
                    </div>
                    <div class="col-md-6">
                    
                     <div class="text-left">
                      <h5>Pilih Berdasarkan Jurusan</h5>
                  </div>
                    <div class="list-group ">
                        @foreach($jurusan as $key=>$value)
                            <a class="list-group-item list-group-item-action list-group-item-primary" href="{{ url('alumni/jurusan/').'/'.$value->jurusan}}">{{$value->jurusan}}</a>
                        @endforeach
                         {{ $jurusan->appends(['sort' => 'jurusan'])->fragment('jurusan')->links() }}
                    </div>
                 
                    </div
                       
                      
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
     