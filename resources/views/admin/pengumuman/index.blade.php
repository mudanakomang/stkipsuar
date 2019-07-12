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
                        <h2 class="text-center">Tambah Pengumuman</h2>
                    </div>
                <div class="panel-default" style="padding: 5px">
                    <a href="{{ url('admin/pengumuman/add') }}" class="btn btn-primary btn-lg" >
                        Tambah Pengumuman </a>
                </div>

                <table id="berita" class="display" width="100%" cellspacing="0">
                    <thead>
                    <th>No</th>
                    <th>Judul</th>
                    <th>Isi</th>
                    <th>Tanggal</th>
                    <th>Manage</th>
                    </thead>
                    <tbody>
                    @foreach($pengumuman as $key=>$value)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td> {{ $value->judul }}</td>
                            <td> {!! substr($value->isi,0,100).'...' !!}</td>
                            <td> {{ \Carbon\Carbon::parse($value->tgl)->format('d M Y') }}</td>
                            <td> <a data-toggle="modal" role="button" href="{{ url('admin/pengumuman/'.$value->id.'/edit') }}" class="btn btn-default"><i class="icon-pencil"></i>Edit</a> | <a href="{{ url('admin/pengumuman/'.$value->id.'/hapus') }}" onclick="return confirm('Apakah Anda yakin menghapus konten ini?');">Hapus</a></td>
                        </tr>

                    @endforeach
                    </tbody>
                </table>


            </div>
        </div>
    </div>


        @endsection

        @section('js')
            <script type="application/javascript">
                $(document).ready(function () {
                    $('#berita').DataTable();
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