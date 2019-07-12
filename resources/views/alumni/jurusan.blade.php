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
                        <h3>Alumni STKIP Suar Bangli Jurusan {{$jurusan[0]->jurusan}}</h3>
                    </header>
                    <div class="panel-body">
                       <table id="jurusan" class="display" width="100%" cellspacing="0">
                           <thead>
                               <th>No</th>
                               <th>NIM</th>
                               <th>Nama</th>
                               <th>Jurusan</th>
                               <th>IPK</th>
                           </thead>
                           <tbody>
                               @foreach($jurusan as $key=>$value)
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td>{{$value->nim}}</td>
                                    <td>{{$value->nama}}</td>
                                    <td>{{$value->jurusan}}</td>
                                    <td>{{$value->ipk}}</td>
                                </tr>
                               @endforeach
                           </tbody>
                       </table>
                    </div>
                    
                    
                       
                      
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
@section('js')
            <script type="application/javascript">
                $(document).ready(function () {
                    $('#jurusan').DataTable();
                });
            </script>
    @endsection