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
                        <h2 class="text-center">Tambah Kegiatan</h2>
                    </div>
                <div class="panel-default" style="padding: 5px">
                    <a href="{{ url('admin/kegiatan/add') }}" class="btn btn-primary btn-lg" >
                        Tambah Kegiatan </a>
                </div>

                <table id="kegiatan" class="display" width="100%" cellspacing="0">
                    <thead>
                    <th>No</th>
                    <th>Nama</th>
                    <th>Keterangan</th>
                    <th>Tanggal</th>
                    <th>Manage</th>
                    </thead>
                    <tbody>
                    @foreach($kegiatan as $key=>$value)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td> {{ $value->nama }}</td>
                            <td> {!! substr($value->keterangan,0,100).'...' !!}</td>
                            <td> {{ \Carbon\Carbon::parse($value->tglterbit)->format('d M Y') }}</td>
                            <td> <a data-toggle="modal" role="button" href="{{ url('admin/kegiatan/'.$value->id.'/edit') }}" class="btn btn-default"><i class="icon-pencil"></i>Edit</a> | <a href="{{url('admin/kegiatan/picture_add/').'/'.$value->id}}">Tambahkan Foto</a> |
                            <a href="{{ url('admin/kegiatan/'.$value->id.'/hapus') }}" onclick="return confirm('Apakah Anda yakin menghapus konten ini?');">Hapus</a> </td>
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
                    $('#kegiatan').DataTable();
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