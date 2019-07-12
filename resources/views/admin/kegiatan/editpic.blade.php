@extends('layouts.master')
@section('navbar')
    @include('admin._navbar')
@endsection
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                @foreach (['danger', 'warning', 'success', 'info'] as $msg)

                    @if(Session::has('alert-' . $msg))
                        <div class="alert alert-{{ $msg }} alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <p >{{ Session::get('alert-' . $msg) }}</p>
                        </div>
                    @endif

                @endforeach
                    <div class="panel-default">
                        <h2 class="text-center">Edit Foto Kegiatan</h2>
                    </div>
                    <div class="panel-default" style="padding: 5px">
                   
                    
                   {!! Form::open(array('url' => 'admin/kegiatan/foto/update/'.$foto->id,'files'=>'true','enctype'=>'multipart/form-data','class'=>'form-horizontal')) !!}
                    <div class="form-group">
                       
                        <div class="col-sm-10 col-sm-offset-2">
                       <img src="{{asset('public/img/kegiatan').'/'.$foto->kegiatan[0]->id.'/'.$foto->gambar}}" width="200px">
                        
                        </div>
                    </div>
                    <div class="form-group">
                        {!! Form::label('gambar','Gambar',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-8">
                            {!! Form::file('gambar') !!}
                            <span class="text-danger">{{ $errors->first('gambar') }}</span>
                        </div>
                    </div>
                   
                    <div class="form-group">
                       <div class="col-sm-10 pull-right">
                           {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
                       </div>
                    </div>
                    {!! Form::close() !!}
                </div>
                
               

            </div>
        </div>
    </div>


        @endsection

        @section('js')
            <script type="application/javascript">
                $(document).ready(function () {
                    $('#kegiatan').DataTable({
                        buttons: [
                          'selectAll',
                          'selectNone'
                            ],
                            language: {
                                buttons: {
                                    selectAll: "Select all items",
                                    selectNone: "Select none"
                                }
                            }
                        });
                });
                
                $('input[id=checkall]').click(function(){
                   var isChecked = $(this).prop('checked');
                      $('input[id^=check]').prop('checked', isChecked);
                      $('input[id^=check]').each(function(){
                           if (this.checked) {
                               console.log($(this).val()); 
                           }
                      });
                      $('input[id^=check]').click(function(){
                          $(this).prop('checked');
                               console.log($(this).val()); 
                           
                      });
                     
                });
            </script>
            <script type="text/javascript">
                $("#datetimepicker1").datetimepicker({
                    startView:3,
                    minView:3,
                    autoclose:true,
                    format:'M yyyy'
                });
            </script>




@endsection