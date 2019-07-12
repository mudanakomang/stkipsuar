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
                        <h3>{{ $program->attribute  }}</h3>
                        </header>
                        <article class="blog-entries">
                            <article class="meta">
                            <span class="date">
                                <span class="fa fa-calendar"></span>
                                {{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$program->publishdate)->format('d F Y') }}
                            </span>
                                <hr>
                            </article>
                        </article>

                        <article style="font-size: 13px">
                            {!!  ($program->value) !!}
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