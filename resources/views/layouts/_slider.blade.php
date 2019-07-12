<div class="carousel fade-carousel slide" data-ride="carousel" data-interval="6000" id="bs-carousel">
  <!-- Overlay -->


  <!-- Indicators -->
  <ol class="carousel-indicators">
        @foreach($sliders as $key=>$value)
            @if($key==0)
                <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
            @else
                <li data-target="#bs-carousel" data-slide-to="{{$key}}"></li>
            @endif
    @endforeach
    
  </ol>
  
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
       @foreach($sliders as $key=>$value)
            @if($key==0)
                 <div class="item slides active">
                     <div>
                        <img src="public/img/slider/{{$value->gambar}}" alt="{{ $value->gambar }}">
                     </div>
                    </div>
            @else
             <div class="item slides">
                  <div>
                        <img src="public/img/slider/{{$value->gambar}}" alt="{{ $value->gambar }}">
                  </div>
                </div>
            @endif
        @endforeach
  </div> 
  <a class="left carousel-control" href="#bs-carousel" role="button" data-slide="prev">
  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
  <span class="sr-only">Previous</span>
</a>
<a class="right carousel-control" href="#bs-carousel" role="button" data-slide="next"> 
  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
  <span class="sr-only">Next</span>
</a>
</div>