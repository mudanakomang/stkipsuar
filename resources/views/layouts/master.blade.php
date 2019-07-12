
<!DOCTYPE html>
<html lang="id">

<head>
    <link rel="shortcut  icon" href="{{ asset('favicon.ico') }}" type="image/x-icon">
    <meta charset="utf-8">
    <meta name="google-site-verification" content="V1mRL9nSOfraSpR2fd9bNmYBWL-JHWltoPvwVCwx0J8" />
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@if(!empty($general))  {{ $general->nama }} @endif | WEBSITE RESMI STKIP SUAR BANGLI</title>
    <meta name="description" content="STKIP SUAR BANGLI merupakan lembaga pendidikan tinggi di bidang kependidikan yang belokasi di Jln. Brigjen Ngurah Rai No.55 Gedung Barat, LC Subak Aya Bangli,80613. Memiliki 3 program studi yaitu Pendidikan Bahasa dan Sastra Indonesia, Pendidikan Bahasa Inggris, Pendidikan Guru Sekolah Dasar dan Lembaga Pelatihan Pariwisata" /> 
    <meta name="keywords" content="sekolah tinggi,sekolah tinggi ilmu pendidikan,sekolah tinggi murah,kampus,kampus stkip,kampus murah,kampus pendidikan bali,pendidikan,pendidikan terjangkau,pendidikan bahasa indnesia,pendidikan bahasa inggris, pendidikan guru sekolah dasar,kuliah cepat,kuliah murah">
    <meta property="og:title" content="WEBSITE RESMI STKIP SUAR BANGLI">
    <meta property="og:description" content="STKIP SUAR BANGLI merupakan lembaga pendidikan tinggi di bidang kependidikan yang belokasi di Jln. Brigjen Ngurah Rai No.55 Gedung Barat, LC Subak Aya Bangli,80613.">
    <meta property="og:image" content="https://stkipsuarbangli.ac.id/public/img/slider/20190305024733.png">
    <meta property="og:url" content="https://stkipsuarbangli.ac.id/beranda">
    <meta name="twitter:card" content="summary_large_image">
    <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-139745429-1"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
        
          gtag('config', 'UA-139745429-1');
        </script>
    
    <style>
    article p{
        text-align:justify;
        
    }
    .panel-body{
        color:#000;
    }
    .col-md-8{
        word-wrap:break-word;
        word-break:break-word;
    }
    .box-body ul>li p{
       word-wrap:break-word;
        word-break:break-word;  
    }
    .background-white{
        background:#fff;
        padding-top:20px;
    }
    .navbar ul.nav > li > a{
        font-size:11px;
    }
        body p{
            color: #000;
            font-family: "Open Sans",sans-serif;
            font-size: 14px;
            font-weight: 400;
            letter-spacing: 0.1px;
            line-height: 1.6em;
          
        }
        article ul > li {
          color:#000000;  
           line-height: 1.6em;
        }
        .span8 .text-justify p{
            color:#000000;
        }
         #top p{
            color: #ffffff;
        }
        #copyright p{
            color: #ffffff;
        }
        #copyright a{
            color:#31b0d5;;
        }
        footer p{
            color: white;
        }
 
/* Declare heights because of positioning of img element */

.carousel-inner .item img {
display: block;
    margin-left: auto;
    margin-right: auto;
    width: 100%;
    height:auto;
    overflow:hidden;
}


.transition-timer-carousel .carousel-caption .carousel-caption-header {
	margin-top: 10px;
	font-size: 24px;
}

@media (min-width: 970px) {
    /* Lower the font size of the carousel caption header so that our caption
    doesn't take up the full image/slide on smaller screens */
	.transition-timer-carousel .carousel-caption .carousel-caption-header {
		font-size: 36px;
	}
}
.transition-timer-carousel .carousel-indicators {
	bottom: 0px;
	margin-bottom: 5px;
}
.transition-timer-carousel .carousel-control {
	z-index: 11;
}
.transition-timer-carousel .transition-timer-carousel-progress-bar {
    height: 5px;
    background-color: #5cb85c;
    width: 0%;
    margin: -5px 0px 0px 0px;
    border: none;
    z-index: 11;
    position: relative;
}
.transition-timer-carousel .transition-timer-carousel-progress-bar.animate{
    /* We make the transition time shorter to avoid the slide transitioning
    before the timer bar is "full" - change the 4.25s here to fit your
    carousel's transition time */
    -webkit-transition: width 4.25s linear;
	-moz-transition: width 4.25s linear;
	-o-transition: width 4.25s linear;
	transition: width 4.25s linear;
}
  .box-clickable:hover {
            cursor: pointer;
        }
        .box-clickable {
            -webkit-transition:all ease-in-out 0.2s;
            transition:all ease-in-out 0.2s
        }
        .box-clickable:hover {
            cursor:pointer;
            outline:1px solid #c6c6c6;
            box-shadow:0px 10px 15px -8px rgba(102,102,102,0.75)
        }
        img.borderthumb {

            border: 5px solid #E1E1E1;


        }
        .media-object {

            display: block;

        }
        .media:first-child{
            padding-top:7px;
            padding-left:7px;
        }
        .media-body {
            text-align: left;
            font-family: "Arial";
        }
        .media-body li{
            color: black;
            font-size: 12px;
        }
        .media-body a{
            color: #337ab7;
        }
        .media-body p{
            text-align:left;
        }
    
        
        
        /*
Fade content bs-carousel with hero headers
Code snippet by maridlcrmn (Follow me on Twitter @maridlcrmn) for Bootsnipp.com
Image credits: unsplash.com
*/

/********************************/
/*       Fade Bs-carousel       */
/********************************/
.fade-carousel {
    height: auto;
    position: relative;

    
}
.fade-carousel .carousel-inner .item {
     height: auto;
    
}
.fade-carousel .carousel-indicators > li {
    margin: 0 2px;
    background-color: #337ab7;
    border-color: #337ab7;
    opacity: .7;
}
.fade-carousel .carousel-indicators > li.active {
  width: 10px;
  height: 10px;
  opacity: 1;
}

/********************************/
/*          Hero Headers        */
/********************************/
.hero {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 3;
    color: #fff;
    text-align: center;
    text-transform: uppercase;
    text-shadow: 1px 1px 0 rgba(0,0,0,.75);
      -webkit-transform: translate3d(-50%,-50%,0);
         -moz-transform: translate3d(-50%,-50%,0);
          -ms-transform: translate3d(-50%,-50%,0);
           -o-transform: translate3d(-50%,-50%,0);
              transform: translate3d(-50%,-50%,0);
}
.hero h1 {
    font-size: 6em;    
    font-weight: bold;
    margin: 0;
    padding: 0;
}

.fade-carousel .carousel-inner .item .hero {
    opacity: 0;
    -webkit-transition: 2s all ease-in-out .1s;
       -moz-transition: 2s all ease-in-out .1s; 
        -ms-transition: 2s all ease-in-out .1s; 
         -o-transition: 2s all ease-in-out .1s; 
            transition: 2s all ease-in-out .1s; 
}
.fade-carousel .carousel-inner .item.active .hero {
    opacity: 1;
    -webkit-transition: 2s all ease-in-out .1s;
       -moz-transition: 2s all ease-in-out .1s; 
        -ms-transition: 2s all ease-in-out .1s; 
         -o-transition: 2s all ease-in-out .1s; 
            transition: 2s all ease-in-out .1s;    
}


@media screen and (min-width: 980px){
    .hero { width: 980px; }    
}
@media screen and (max-width: 640px){
    .hero h1 { font-size: 4em; }    
}

    </style>


    <link href=" {{ asset('css/google.css') }}" rel='stylesheet' type='text/css'>

    <!-- Bootstrap and Font Awesome css -->
    <link rel="stylesheet" href="{{ asset('css/font-awesome.min.css')}}">
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css')}}">

    <!-- Css animations  -->
    <link href="{{ asset('css/animate.css') }}" rel="stylesheet">
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
    <!-- Theme stylesheet, if possible do not edit this stylesheet -->
    <link href="{{ asset('css/style.default.css') }}" rel="stylesheet" id="theme-stylesheet">

    <!-- Custom stylesheet - for your changes -->
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
    <link href="{{ asset('css/jquery.dataTables.min.css') }}" rel="stylesheet">

    <!-- Responsivity for older IE -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and apple touch icons-->
    <link rel="shortcut icon" href="{{ asset('img/favicon.ico') }}" type="image/x-icon" />
    <link rel="apple-touch-icon" href="{{ asset('img/apple-touch-icon.png') }}" />
    <link rel="apple-touch-icon" sizes="57x57" href="{{ asset('img/apple-touch-icon-57x57.png') }}" />
    <link rel="apple-touch-icon" sizes="72x72" href="{{ asset('img/apple-touch-icon-72x72.png') }}" />
    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset('img/apple-touch-icon-76x76.png') }}" />
    <link rel="apple-touch-icon" sizes="114x114" href="{{ asset('img/apple-touch-icon-114x114.png') }}" />
    <link rel="apple-touch-icon" sizes="120x120" href="{{ asset('img/apple-touch-icon-120x120.png') }}" />
    <link rel="apple-touch-icon" sizes="144x144" href="{{ asset('img/apple-touch-icon-144x144.png') }}" />
    <link rel="apple-touch-icon" sizes="152x152" href="{{ asset('img/apple-touch-icon-152x152.png') }}" />
    <!-- owl carousel css -->

    <link href="{{ asset('css/owl.carousel.css') }}" rel="stylesheet">
    <link href="{{ asset('css/owl.theme.css') }}" rel="stylesheet">
    <link href="{{ asset('css/bootstrap-datetimepicker.min.css') }}" rel="stylesheet">
    <link href="{{ asset('fullcalendar/fullcalendar.css') }}" rel="stylesheet">
    <link href="{{ asset('css/bootstrap-colorpicker.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/prettyPhoto.css') }}" rel="stylesheet">
    <link href="{{ asset('css/thumbnail-gallery.css')}}" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="{{ asset('css/normalize.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/demo.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/tabs.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/tabstyles.css') }}" />
    <script src="{{asset('js/modernizr.custom.js')}}"></script>
    
</head>

<body>
<svg class="hidden">
    <defs>
        <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z"/>
    </defs>
</svg>
<div id="all">

    <header>

        <!-- *** TOP ***
_________________________________________________________ -->
        <div id="top">
            <div class="container">
                <div class="row">
                    <div class="col-xs-5 contact">
                        <p class="hidden-sm hidden-xs">Hubungi kami di  {{ $general->telp }} atau <a href="mailto:{{$general->email}}" target="_top">{{ $general->email }}</a> </p>
                        <p class="hidden-md hidden-lg"><a href="#" data-animate-hover="pulse"><i class="fa fa-phone"></i></a>  <a href="mailto:{{$general->email}}" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                        </p>
                    </div>
                    <div class="col-xs-7">
                        <div class="social">
                            <a href="{{ url($general->fb) }}" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                            <a href="#" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                            <a href="mailto:{{$general->email}}" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                        </div>



                    </div>
                </div>
            </div>
        </div>

        <!-- *** TOP END *** -->

        <!-- *** NAVBAR ***
_________________________________________________________ -->
        @yield('navbar')


        <!-- *** NAVBAR END *** -->

    </header>

    <!-- *** LOGIN MODAL ***
_________________________________________________________ -->

    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
        <div class="modal-dialog modal-sm">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="Login">Customer login</h4>
                </div>
                <div class="modal-body">
                    <form action="customer-orders.html" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" id="email_modal" placeholder="email">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="password_modal" placeholder="password">
                        </div>

                        <p class="text-center">
                            <button class="btn btn-template-main"><i class="fa fa-sign-in"></i> Log in</button>
                        </p>

                    </form>

                    <p class="text-center text-muted">Not registered yet?</p>
                    <p class="text-center text-muted"><a href="customer-register.html"><strong>Register now</strong></a>! It is easy and done in 1&nbsp;minute and gives you access to special discounts and much more!</p>

                </div>
            </div>
        </div>
    </div>

    <!-- *** LOGIN MODAL END *** -->

   @yield('slider')
   @yield('main-page')
    @yield('content')




    <!-- *** FOOTER ***
_________________________________________________________ -->

    <footer id="footer">
        <div class="container">
            

            <div class="col-md-4 col-sm-6">

                <h4>Kontak</h4>

                <p><strong>{{$general->nama}}</strong>
                    <br>{{ $general->alamat1}}
                    <br>{{ $general->alamat2}}
                    <br>{{ $general->alamat3}}
                    <br>
                    <br>Telepon : {{$general->telp}}
                    <br>Email : <a href="mailto:{{$general->email}}">{{$general->email}}</a>


                </p>

              

             

            </div>
            <!-- /.col-md-3 -->



            <div class="col-md-4 col-sm-6">

                <h4>Galeri</h4>

                <div class="photostream">
                    @foreach($galeries as $key=>$value)
                    <div>
                        <a href="{{url('galeri')}}">
                            <img src="{{ asset('public/img/galeri').'/'.$value->gambar }}" height="100" class="img-responsive" alt="{{$value->keterangan}}">
                        </a>
                    </div>
                    @endforeach
                   
                </div>

            </div>
            <!-- /.col-md-3 -->
        </div>
        <!-- /.container -->
    </footer>
    <!-- /#footer -->

    <!-- *** FOOTER END *** -->

    <!-- *** COPYRIGHT ***
_________________________________________________________ -->

    <div id="copyright">
        <div class="container">
            <div class="col-md-12">
                <div class="row">
                <p class="text-muted pull-left">&copy; {{ \Carbon\Carbon::now('Asia/Makassar')->format('Y') }} STKIP SUAR BANGLI</p>
                 </div>
               <p class="text-muted pull-left" style="font-size:9px;">Designed By I Komang Mudana <a href="mailto:mudanakomang@hotmail.com">mudanakomang@hotmail.com</a></p>
                
                
            </div>
           
                 
           
             
        </div>
        
    </div>
    <!-- /#copyright -->

    <!-- *** COPYRIGHT END *** -->

</div>
<!-- /#all -->

<!-- #### JAVASCRIPT FILES ### -->

<script src="{{ asset('js/jquery.min.js') }}"></script>
<script>
    window.jQuery || document.write('<script src="{{ asset('js/jquery-1.11.0.min.js') }}"><\/script>')
</script>
<script src="{{ asset('js/bootstrap.min.js') }}"></script>

<script src="{{ asset('js/jquery.cookie.js') }}"></script>
<script src="{{ asset('js/waypoints.min.js') }}"></script>
<script src="{{ asset('js/jquery.counterup.min.js') }}"></script>
<script src="{{ asset('js/jquery.parallax-1.1.3.js') }}"></script>
<script src="{{ asset('js/front.js') }}"></script>



<!-- owl carousel -->
<script src="{{ asset('js/owl.carousel.min.js') }}"></script>
<script src="{{ asset('js/jquery.dataTables.min.js') }}"> </script>
<script src="{{ asset('js/bootstrap-datetimepicker.min.js') }}"></script>
<script src="{{ asset('fullcalendar/lib/moment.min.js') }}"></script>
<script src="{{ asset('fullcalendar/fullcalendar.js') }}"></script>
<script src="{{ asset('js/bootstrap-colorpicker.min.js') }}"></script>
<script src="{{ asset('js/jquery.prettyPhoto.js')}}"></script>
<script src="{{ asset('vendor/ckeditor/ckeditor.js')}}"></script>
<script>
$(document).ready(function(){
  $('.dropdown-submenu a.test').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});
</script>
@yield('js')
</body>

</html>
