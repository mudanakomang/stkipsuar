@extends('layouts.master')
@section('navbar')
    @include('admin._navbar')
@endsection
@section('main-page')
    <div class="bar background-white">
        <div class="container">
            <div class="col-md-12">
                @foreach (['danger', 'warning', 'success', 'info'] as $msg)

                    @if(Session::has('alert-' . $msg))
                        <div class="alert alert-{{ $msg }} alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <p >{{ Session::get('alert-' . $msg) }}</p>
                        </div>
                    @endif

                @endforeach
                <div class="row">
                    <div class="col-md-8">
                        <section class="blog-entries">
                        <div id="kalender"></div>


                        </section>
                        <div class="blog-entries">
                            <div class="note">
                                <strong>Catatan:</strong> Upload file kalender akademik (pdf)
                            </div>

                          {!! Form::open(['url'=>'admin/kalender/upload','method'=>'post','class'=>'form-horizontal','files'=>'true','enctype'=>'multipart/form-data','novalidate']) !!}
                            <div class="form-group">

                                <div class="col-lg-6">
                                    {!! Form::file('file',null,['class'=>'form-control']) !!}
                                    <span class="text-danger">{{ $errors->first('file') }}</span>
                                </div>
                            </div>

                                 {!! Form::submit('Upload',['class'=>'btn btn-default']) !!}

                            {!! Form::close() !!}
                        </div>

                    </div>
                    <div class="col-md-4">
                    <div class="panel">
                        <div class=" panel">
                            <a class="btn btn-info" href="#" data-toggle="modal" data-target="#tambahEvent">Tambahkan Event</a>
                        </div>
                        <div class="well well-sm" id="deleteEventsDiv">
                            <legend>
                                Hapus Event
                            </legend>
                            <i class="fa fa-trash fa-4x"></i>
                            <div class="note">
                                <strong>Catatan:</strong> Seret dan lepaskan even disini untuk menghapus
                            </div>
                        </div>

                        <div class="modal fade" id="tambahEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Tambahkan Event</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <div class="row">

                                                {!! Form::open(['url'=>'admin/kalender/tambah','method'=>'post','class'=>'form-horizontal','id'=>'tambahEventForm']) !!}
                                                <div class="form-group">
                                                    {!! Form::label('title','Judul',['class'=>'col-lg-2 control-label']) !!}
                                                    <div class="col-lg-6">
                                                        {!! Form::text('title','',['class'=>'form-control']) !!}
                                                        <span class="text-danger">{{ $errors->first('title') }}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    {!! Form::label('start','Mulai',['class'=>'col-lg-2 control-label']) !!}
                                                    <div class="col-lg-6">
                                                        {!! Form::text('start','',['class'=>'form-control','id'=>'datetimepicker1','readonly']) !!}
                                                        <span class="text-danger">{{ $errors->first('start') }}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    {!! Form::label('end','Berakhir',['class'=>'col-lg-2 control-label']) !!}
                                                    <div class="col-lg-6">
                                                        {!! Form::text('end','',['class'=>'form-control','id'=>'datetimepicker2','readonly']) !!}
                                                        <span class="text-danger">{{ $errors->first('end') }}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    {!! Form::label('color','Warna',['class'=>'col-lg-2 control-label']) !!}
                                                    <div class="col-lg-6">
                                                        {!! Form::text('color','',['class'=>'form-control','id'=>'color','readonly']) !!}
                                                        <span class="text-danger">{{ $errors->first('color') }}</span>
                                                    </div>
                                                </div>
                                                {!! Form::close() !!}

                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="$('#tambahEventForm').submit();">Simpan</button>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="panel-default ">
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

                                        <div class="modal fade" id="editModal{{$event->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Tambahkan Event</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="container-fluid">
                                                            <div class="row">

                                                                {!! Form::open(['url'=>'admin/kalender/update/'.$event->id,'method'=>'post','class'=>'form-horizontal','id'=>'editEventForm']) !!}
                                                                <div class="form-group">
                                                                    {!! Form::label('title','Judul',['class'=>'col-lg-2 control-label']) !!}
                                                                    <div class="col-lg-6">
                                                                        {!! Form::text('title',\App\Kalender::find($event->id)->title,['class'=>'form-control']) !!}
                                                                        <span class="text-danger">{{ $errors->first('title') }}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    {!! Form::label('start','Mulai',['class'=>'col-lg-2 control-label']) !!}
                                                                    <div class="col-lg-6">
                                                                        {!! Form::text('start',\Carbon\Carbon::createFromFormat('Y-m-d H:i:s',\App\Kalender::find($event->id)->start)->format('Y-m-d'),['class'=>'form-control','id'=>'datetimepickerstart'.$event->id,'readonly']) !!}
                                                                        <span class="text-danger">{{ $errors->first('start') }}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    {!! Form::label('end','Berakhir',['class'=>'col-lg-2 control-label']) !!}
                                                                    <div class="col-lg-6">
                                                                        @if(!empty($event->end))
                                                                        {!! Form::text('end',\Carbon\Carbon::createFromFormat('Y-m-d H:i:s',\App\Kalender::find($event->id)->end)->format('Y-m-d'),['class'=>'form-control','id'=>'datetimepickerend'.$event->id,'readonly']) !!}
                                                                        @else
                                                                            {!! Form::text('end','',['class'=>'form-control','id'=>'datetimepickerend'.$event->id,'readonly']) !!}
                                                                        @endif
                                                                        <span class="text-danger">{{ $errors->first('end') }}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    {!! Form::label('color','Warna',['class'=>'col-lg-2 control-label']) !!}
                                                                    <div class="col-lg-6">
                                                                        {!! Form::text('color',\App\Kalender::find($event->id)->color,['class'=>'form-control','id'=>'color1','readonly']) !!}
                                                                        <span class="text-danger">{{ $errors->first('color') }}</span>
                                                                    </div>
                                                                </div>
                                                                {!! Form::close() !!}

                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary" onclick="$('#editEventForm').submit();">Simpan</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    @endforeach
                                </div>
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
    <section class="bar background-gray no-mb">
        <div class="container">

            <div class="col-md-12">
                <div class="heading text-center">
                    <h2>Konten</h2>
                </div>

                <!-- *** BLOG HOMEPAGE ***
_________________________________________________________ -->

                <div class="row">

                    <!-- /.box-image-text -->

                </div>

                <!-- /.row -->

                <!-- *** BLOG HOMEPAGE END *** -->

            </div>
        </div>

        <!-- /.container -->
    </section>
    @section('js')
       <script>
        var d ={!! $data !!}
         $('#kalender').fullCalendar({
            editable:true,
             events: d,
             header: {
                 left: 'prev,next today',
                 center: 'title',
                 right: 'month,agendaWeek,agendaDay'
             },

            eventClick:function(calEvent){
                 window.location="#";
                 $('#editModal'+calEvent.id).modal('show');
            },
            eventDragStop: function( event ) {
                // This condition makes it easier to test if the event is over the trash can using Jquery
                if($('div#deleteEventsDiv').is(':hover')){
                    // Confirmation popup
                    var token="{{ csrf_token() }}";
                        var id =event.id;

                            // You can change the URL and other details to your liking.
                            // On success a small box notification will fire
                            $.ajax({
                                url: 'kalender/hapus/' + event.id,
                                type: 'POST',
                                data:{
                                    _token:token,
                                    id:id,
                                },
                                success:function () {
                                    window.location.href='kalender-akademik';
                                }


                            });

                    };

            },


         });
       </script>
       <script type="text/javascript">
           $("#datetimepicker1").datetimepicker({
               format: "yyyy-mm-dd",
               autoclose: true,
               todayBtn: true,
               pickerPosition: "bottom-left",
               minView:2,
           });
           $("#datetimepicker2").datetimepicker({
               format: "yyyy-mm-dd",
               autoclose: true,
               todayBtn: true,
               pickerPosition: "bottom-left",
               minView:2,
           });

              $("input[id^=datetimepickerend]").datetimepicker({
                  format: "yyyy-mm-dd",
                  autoclose: true,
                  todayBtn: true,
                  pickerPosition: "bottom-left",
                  minView:2,
              })



               $("input[id^=datetimepickerstart]").datetimepicker({
                   format: "yyyy-mm-dd",
                   autoclose: true,
                   todayBtn: true,
                   pickerPosition: "bottom-left",
                   minView:2,
               })


           $('#color').colorpicker({});
           $('#color1').colorpicker({});
           @if(count($errors)>0 && !$errors->first('file'))
               $('#tambahEvent').modal('show');
            @endif
       </script>
        <script>
            function goTo (id) {
                $('#kalender').fullCalendar('gotoDate',id);
            }
        </script>

        @endsection
@endsection