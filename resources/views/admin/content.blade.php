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
                    <h2>Content >> Slider</h2>
                </div>
                <div class="panel-default" style="padding: 5px">
                    <a href="{{ url('slider/add') }}" class="btn btn-primary btn-lg" >
                        Tambah Slider </a>
                </div>

                <table id="slider_table" class="display" width="100%" cellspacing="0">
                    <thead>
                    <th>No</th>
                    <th>Judul</th>
                    <th>Deskripsi</th>
                    <th>Gambar</th>
                    <th>Status</th>
                    <th>Manage</th>
                    </thead>
                    <tbody>
                    @foreach($sliders as $key=>$value)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td> {{ $value->judul }}</td>
                            <td> {{ strip_tags($value->deskripsi) }}</td>
                            <td> <img src="{{ asset('public/img/slider').'/'.$value->gambar}}" alt="{{ $value->gambar }}" height="30px"></td>
                            <td> @if($value->status=='1') {{ 'Aktif' }} @else {{ 'Tidak Aktif' }} @endif</td>
                            <td> <a data-toggle="modal" role="button" href="{{ url('admin/content/slider/'.$value->id.'/edit') }}" class="btn btn-default"><i class="icon-pencil"></i>Edit</a> | <a href="{{ url('admin/content/slider/'.$value->id.'/hapus') }}" onclick="return confirm('Apakah Anda yakin menghapus konten ini?');">Hapus</a></td>
                        </tr>

                    @endforeach
                    </tbody>
                </table>


        </div>
    </div>



    @endsection

@section('js')
    <script type="application/javascript">
        $(document).ready(function () {
            $('#slider_table').DataTable();
        });
    </script>
    <script>
        $('#submitslider').on('click',function () {
           $('#formSlider').submit();
        })
    </script>
   <script>
       @if(count($errors) > 0)
           $('#addSliderModal').modal('show');
           @endif
   </script>
    <script>
        $(document).on("click", '#openEditDialog', function () {
            var judul = $(this).data('id');
            $(".modal-body #judul").val(judul);
            $('#openEditDialog').modal('show');
        });
    </script>
    <script>
        @if(!empty($slider))
            $('#editSliderModal').modal('show');
            @endif
    </script>

    @endsection