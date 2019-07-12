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
                        <h2 class="text-center">Foto Kegiatan {{\App\Kegiatan::find($id)->nama}}</h2>
                    </div>
                    <div class="panel-default" style="padding: 5px">
                   
               
                   {!! Form::open(array('url' => 'admin/kegiatan/foto/store','files'=>'true','enctype'=>'multipart/form-data','class'=>'form-horizontal')) !!}
                    <div class="form-group">
                        {!! Form::label('gambar','Gambar',['class'=>'col-sm-2 control-label']) !!}
                        <div class="col-sm-8">
                            {!! Form::file('gambar') !!}
                            <span class="text-danger">{{ $errors->first('gambar') }}</span>
                        </div>
                    </div>
                    {!! Form::hidden('id',$id) !!}
                    <div class="form-group">
                       <div class="col-sm-10 pull-right">
                           {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
                       </div>
                    </div>
                    {!! Form::close() !!}
                </div>
                
                <div class="panel-body">
                   <form id="frm-example" action="../foto/hapus" method="POST">
                         {{ csrf_field() }}
                   <table id="kegiatan" class="display" width="100%" cellspacing="0">
                        <thead>
                             <td data-orderable="false" class="check">
                                <input type="checkbox" id="checkall" value="" /> Pilih Semua
                            </td>
                            <th>Foto</th>
                            <th>Manage</th>
                        </thead>
                        <tbody>
                            @foreach($foto as $key=>$value)
                                <tr>
                                   <td><input type='checkbox' id="check{{$value->id}}" name='data[]' value="{{$value->id}}"></td>
                                    <td><img src="{{asset('public/img/kegiatan/').'/'.$id.'/'.$value->gambar }}" width="100px;"/></td>
                                    <td><a href="{{url('admin/kegiatan/foto/edit').'/'.$value->id}}">Edit</a></td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                 
                     <div class="form-group">
                       <div class=" pull-left">
                           {!! Form::submit('Hapus Yang Dipilih',['class'=>'btn btn-danger']) !!}
                       </div>
                    </div>
                    </form>
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