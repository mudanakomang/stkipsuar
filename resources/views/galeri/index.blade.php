@extends('layouts.master')
@section('navbar')
    @include('layouts._navbar')
@endsection
@section('main-page')
   <div class="container">

      <h1 class="my-4 text-center text-lg-left">Galeri</h1>

      <div class="row text-center text-lg-left" style="padding-bottom:20px;">
        @foreach($galeri as $key=>$value)
        <div class="col-lg-3 col-md-4 col-xs-6" style="height:250px; width:300px;">
          <a href="{{url('public/img/galeri').'/'.$value->gambar}}" class="d-block mb-4 h-100" rel="prettyPhoto[pp_gal]" title="{{$value->keterangan}}">
            <img class="img-fluid img-thumbnail" src="{{asset('public/img/galeri').'/'.$value->gambar }}" width="400" height="300"  alt="{{$value->keterangan}}">
          </a>
        </div>
        @endforeach
         
      </div>
 
 <br>
 <br>
  {{ $galeri->appends(['sort' => 'created_at'])->links() }}
    </div>

    @endsection
   
@section('content')
@include('layouts._content')
@endsection
@section('js')
<script>
    $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'light_square',slideshow:6000, autoplay_slideshow:true,social_tools:false});
</script>
@endsection