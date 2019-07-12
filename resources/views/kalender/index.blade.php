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
                        <div id="kalender"></div>


                        </section>

                        <section class="blog-entries">
                            <a href="{{ url('akademik/kalender-akademik/download') }}"><strong>Download Kalender Akademik {{ \Carbon\Carbon::createFromFormat('Y-m-d',$general->ta_start)->format('Y').' - '.\Carbon\Carbon::createFromFormat('Y-m-d',$general->ta_end)->format('Y') }}</strong></a>
                        </section>

                    </div>
                    <div class="col-md-4">
                        <h2>Keterangan</h2>
                        <div class="panel panel-default ">
                            <div class="panel-content">
                                <div class="list-group">
                                    @foreach(json_decode($data) as $event)

                                        <a href="#" class="list-group-item" id="{{$event->start}}" onclick="goTo(this.id);" ><i class="fa  fa-arrow-right" style="color: {{$event->color}}"></i> {{ $event->title }}
                                            @if(empty($event->end))
                                                <span class="label label-primary pull-right"><small >{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$event->start)->format('Y-m-d') }} </small></span>
                                            @else
                                            <span class="label label-primary pull-right"><small >{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$event->start)->format('Y-m-d') }} sd {{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$event->end)->format('Y-m-d') }}</small></span>
                                                @endif
                                        </a>

                                        @endforeach
                                </div>
                            </div>
                        </div>
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
        var d ={!! $data !!}
         $('#kalender').fullCalendar({
            eventStartEditable: false,
             events: d,
             header: {
                 left: 'prev,next today',
                 center: 'title',
                 right: 'month,agendaWeek,agendaDay'
             },

         });
       </script>
        <script>
            function goTo (id) {
                $('#kalender').fullCalendar('gotoDate',id);
            }
        </script>

    
@endsection