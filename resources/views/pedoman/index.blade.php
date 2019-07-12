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
                        <h3>{{ 'Pedoman Akademik Tahun Ajaran '.\Carbon\Carbon::parse($general->ta_start)->format('Y').'-'.\Carbon\Carbon::parse($general->ta_en)->format('Y')   }}</h3>
                        </header>

                        <article class="blog-entries">
                            <article class="meta">
                            <span class="date">
                                <span class="fa fa-calendar"></span>
                                {{ \Carbon\Carbon::parse($pedoman->publishdate)->format('d F Y') }}
                            </span>
                            </article>
                                <hr>
                        </article>
                    <article class="blog-entries">
                        <div class="thumbnail">
                            <img src="{{ asset('public/img/pedoman').'/'.$pedoman->cover }}" alt="{{ $pedoman->cover }}">
                            <span class="caption">Pedoman Akademik Tahun Ajaran {{ \Carbon\Carbon::parse($general->ta_start)->format('Y') .'-'.\Carbon\Carbon::parse($general->ta_end)->format('Y') }}
                            </span>
                        </div>

                    </article>
                </section>
                <section class="blog-entries">
                    <a href="{{ url('akademik/pedoman-akademik/download') }}"><strong>Download Pedoman Akademik {{ \Carbon\Carbon::createFromFormat('Y-m-d',$general->ta_start)->format('Y').' - '.\Carbon\Carbon::createFromFormat('Y-m-d',$general->ta_end)->format('Y') }}</strong></a>
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