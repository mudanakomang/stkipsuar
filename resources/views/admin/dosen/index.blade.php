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
                    <h2>Slider</h2>
                </div>
                <div class="panel-default" style="padding: 5px">
                    <a href="{{ url('admin/dosen/add') }}" class="btn btn-primary btn-lg" >
                        Tambah Dosen </a>
                </div>

                <table id="dosen" class="display" width="100%" cellspacing="0">
                    <thead>
                    <th>No</th>
                    <th>ID Dosen</th>
                    <th>Nama</th>
                    <th>File</th>
                    <th>Alamat</th>
                    <th>No HP</th>
                    <th>Tanggal Lahir</th>
                    <th>Email</th>
                   
                    <th>Manage</th>
                    </thead>
                    <tbody>
                    @foreach($dosens as $key=>$value)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td> {{ $value->nik }}</td>
                            <td><a href="{{ url('dosen/profil').'/'.$value->id }}">{{$value->name}}</a></td>
                            <td><a href="{{url('admin/dosen/'.$value->id.'/files')}}">Lihat File</a></td>
                            <td>{{ $value->alamat }}</td>
                            <td>{{ $value->nomorhp }}</td>
                            <td>{{ \Carbon\Carbon::parse($value->tgl_lahir)->format('d M Y') }}</td>
                            <td><a href="mailto:{{$value->email}}">{{$value->email}}</a></td>
                           

                            <td> <a data-toggle="modal" role="button" href="{{ url('admin/dosen/'.$value->id.'/edit') }}" class="btn btn-default"><i class="icon-pencil"></i>Edit</a>| <a href="{{ url('admin/dosen/'.$value->id.'/hapus') }}" onclick="return confirm('Apakah Anda yakin menghapus konten ini?');">Hapus</a></td>
                        </tr>

                    @endforeach
                    </tbody>
                </table>
                <br>


        </div>
    </div>



@endsection



@section('js')
    <script type="application/javascript">
        $(document).ready(function () {
            $('#dosen').DataTable();
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