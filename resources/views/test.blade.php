@extends('layouts.master')
@section('navbar')
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">

            <div class="navbar navbar-default yamm" role="navigation" id="navbar" style="padding-bottom: 14px">

                <div class="container">
                    <div class="navbar-header">

                        <a class="navbar-brand home" href="{{ url('beranda') }}">
                            <img  src="img/logo.png" alt="STKIP SUAR BANGLI" class="hidden-xs hidden-sm">
                            <img  src="img/logo.png" alt="STKIP SUAR BANGLI" class="visible-xs visible-sm"><span class="sr-only">STKIP SUAR BANGLI</span>
                        </a>

                        <div class="navbar-buttons">
                            <button type="button" class="navbar-toggle btn-template-main" data-toggle="collapse" data-target="#navigation">
                                <span class="sr-only">Toggle navigation</span>
                                <i class="fa fa-align-justify"></i>
                            </button>
                        </div>
                    </div>
                    <!--/.navbar-header -->

                    <div class="navbar-collapse collapse" id="navigation">

                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="{{ url('beranda') }}" >Beranda </a>
                            </li>
                            <li class="dropdown ">
                                <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown">Profil <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="{{ url('profil/sambutan-ketua-yayasan') }}">Sambutan Ketua Yayasan Kresna Andhi Mandiri</a>
                                    </li>
                                    <li><a href="{{ url('profil/sambutan-ketua-stkip') }}">Sambutan Ketua STKIP Suar Bangli</a>
                                    </li>
                                    <li><a href="{{ url('profil/sejarah') }}">Sejarah STKIP Suar Bangli</a>
                                    </li>
                                    <li><a href="{{ url('profil/visi-misi') }}">Visi Misi</a>
                                    </li>
                                    <li><a href="{{ url('profil/logo') }}">Logo STKIP SUAR BANGLI</a>
                                    </li>
                                    <li><a href="{{ url('profil/struktur-organisasi') }}">Struktur Organisasi</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Program Studi<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="{{ url('program-studi/bahasa-dan-sastra-indonesia') }}">Pendidikan Bahasa dan Sastra Indonesia</a>
                                    </li>
                                    <li><a href="{{ url('program-studi/bahasa-inggris') }}">Pendidikan Bahasa Inggris</a>
                                    </li>
                                    <li><a href="{{ url('program-studi/pgsd') }}">Pendidikan Guru Sekolah DAsar (PGSD)</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fasilitas <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="{{ url('fasilitas/ruang-kuliah') }}">Ruang Kuliah</a>
                                    </li>
                                    <li><a href="{{ url('fasilitas/ruang-administratsi') }}">Ruang Administrasi</a>
                                    </li>
                                    <li><a href="{{ url('fasilitas/ruang-laboratorium') }}">Ruang Laoratorium</a>
                                    </li>
                                    <li><a href="{{ url('fasilitas/ruang-perpustakaan') }}">Ruang Perpustakaan</a>
                                    </li>
                                    <li><a href="{{ url('fasilitas/kartu-mahasiswa') }}">Kartu Mahasiswa</a>
                                    </li>
                                    <li><a href="{{ url('fasilitas/free-wifi') }}">Free Wifi</a>
                                    </li>
                                    <li><a href="{{ url('fasilitas/beasiswa') }}">Beasiswa</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Akademik <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="{{ url('akademik/pedoman-akademik') }}">Pedoman Akademik</a>
                                    </li>
                                    <li><a href="{{ url('akademik/kalender-akademik') }}">Kalender Akademik</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Penelitian  <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="{{ url('penelitian/penelitian-pengabdian-masyarakat') }}">Penelitian Dan Pengabdian Masyarakat</a>
                                    </li>
                                    <li><a href="{{ url('penelitian/jurnal') }}">Jurnal Pendidikan Wahan Chitta</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pelatihan Pariwisata <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="{{ url('pelatihan/lembaga-pelatihan-bits') }}">Lembaga Pelatihan BITS</a>
                                    </li>
                                    <li><a href="{{ url('pelatihan/prodi-bits') }}">Prodi BITS</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mahasiswa Baru <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="{{ url('mahasiswa-baru/pendaftaran') }}">Pendaftaran Mahasiswa Baru</a>
                                    </li>
                                    <li><a href="{{ url('mahasiswa-baru/informasi') }}">Informasi Pendaftaran Mahasiswa Baru</a>
                                    </li>
                                    <li><a href="{{ url('mahasiswa-baru/biaya') }}">Biaya Studi Mahasiswa Baru</a>
                                    </li>
                                    <li><a href="{{ url('mahasiswa-baru/lembaga-pelatihan') }}">Penerimaan Siswa Lembaga Pelatihan BITS</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="{{ url('galeri') }}" >Galeri </a>
                            </li>
                            <li class="dropdown">
                                <a href="{{ url('alumni') }}">Alumni </a>
                            </li>
                            <div class="collapse clearfix" id="search">
                                <form class="navbar-form" role="search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search">
                                        <span class="input-group-btn">
                                            <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </ul>
                        <!--/.nav-collapse -->

                    </div>
                </div>


            </div>
            <!-- /#navbar -->

        </div>
    </nav>
    @endsection
@section('slider')
 <div class="home-carousel">

        <div class="dark-mask"></div>

        <div class="container">
            <div class="homepage owl-carousel">
                <div class="item">
                    <div class="row">
                        <div class="col-sm-5 right">

                            <h1>Judul</h1>
                            <p>Deskripsi1
                                <br />Deskripsi1</p>
                        </div>
                        <div class="col-sm-7">
                            <img class="img-responsive" src="img/1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="row">

                        <div class="col-sm-7 text-center">
                            <img class="img-responsive" src="img/2.jpg" alt="">
                        </div>

                        <div class="col-sm-5">
                            <h2>Judul 2</h2>
                            <ul class="list-style-none">
                                <li>Deskripsi Deskripsi Deskripsi </li>


                            </ul>
                        </div>

                    </div>
                </div>
                <div class="item">
                    <div class="row">
                        <div class="col-sm-5 right">
                            <h1>Judul 3</h1>
                            <ul class="list-style-none">
                                <li>Deskripsi</li>

                            </ul>
                        </div>
                        <div class="col-sm-7">
                            <img class="img-responsive" src="img/3.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.project owl-slider -->
        </div>
    </div>
    @endsection

@section('main-page')
    <div class="bar background-white">
    <div class="container">
        <div class="col-md-12">


            <div class="row">
                <div class="col-md-4">
                    <div class="box-simple">
                        <div class="icon">
                            <i class="fa fa-newspaper-o"></i>
                        </div>
                        <h3>Berita</h3>
                        <p>Keterangan</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box-simple">
                        <div class="icon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <h3>Agenda</h3>
                        <p>Keterangan</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box-simple">
                        <div class="icon">
                            <i class="fa fa-bullhorn"></i>
                        </div>
                        <h3>Pengumuman</h3>
                        <p>Keterangan</p>
                    </div>
                </div>
            </div>


        </div>
    </div>
    </div>

    @endsection
@section('content')
    <section class="bar background-gray no-mb">
        <div class="container">

            <div class="col-md-12">
                <div class="heading text-center">
                    <h2>Konten</h2>
                </div>

                <p class="text">Keterangan Konten <span class="accent"></span>
                </p>

                <!-- *** BLOG HOMEPAGE ***
_________________________________________________________ -->

                <div class="row">
                    <div class="col-md-4 col-sm-6">
                        <div class="box-image-text blog">
                            <div class="content">
                                <h4>Konten 1</h4>
                                <p class="text-center">Intro</p>

                            </div>
                        </div>
                        <!-- /.box-image-text -->

                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="box-image-text blog">
                            <div class="content">
                                <h4>Konten 1</h4>
                                <p class="text-center">Intro</p>

                            </div>
                        </div>
                        <!-- /.box-image-text -->

                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="box-image-text blog">
                            <div class="content">
                                <h4>Konten 1</h4>
                                <p class="text-center">Intro</p>

                            </div>
                        </div>
                        <!-- /.box-image-text -->

                    </div>
                </div>
                <!-- /.row -->

                <!-- *** BLOG HOMEPAGE END *** -->

            </div>

        </div>
        <!-- /.container -->
    </section>
    @endsection