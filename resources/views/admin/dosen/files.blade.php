@extends('layouts.master')
@section('navbar')
@include('dosen._navbar')
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
               <h2>File Dosen {{ $dosen->name }}</h2>
           </div>

       </div>

        
          <div class="panel-default">
               <h2>List File</h2>
           </div>
           <table id="file" class="display" width="100%" cellspacing="0">
                    <thead>
                    <th>No</th>
                    <th>File Name</th>
                    <th>Tanggal Upload</th>
                   
                    </thead>
                    <tbody>
                    @foreach($dosen->files as $key=>$value)
                        <tr>
                            <td> {{ ++$key }}</td>
                            <td><a href="{{ asset(url('public/file/dosen/').'/'.$dosen->id.'/'.$value->filename) }}">{{$value->filename}}</a></td>
                            <td> {{ \Carbon\Carbon::parse($value->created_at)->format('d M Y') }}</td>
                           
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
                    $('#file').DataTable();
                });
            </script>
    <script type="text/javascript">
        $("#datetimepicker1").datetimepicker({
            format: "dd MM yyyy",
            autoclose: true,
            todayBtn: true,
            pickerPosition: "bottom-left",
            minView:3,
        });
    </script>
    @endsection