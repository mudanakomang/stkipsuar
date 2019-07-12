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
                        <h3>{{ 'Prodi BITS'   }}</h3>
                        </header>
                    @foreach($prodi as $key=>$value)
                        <article class="blog-entries">
                            <article class="meta">
                            <header>
                                <h4>{{$value->prodi}}</h4>
                            </header>
                            </article>
                        </article>
                    <article style="font-size: 13px">
                        {!!  ($value->keterangan) !!}
                    </article>
                       <hr>
                    @endforeach
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