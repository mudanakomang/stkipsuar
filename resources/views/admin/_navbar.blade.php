<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">

        <div class="navbar navbar-default yamm" role="navigation" id="navbar" style="padding-bottom: 14px">

            <div class="container">
                <div class="navbar-header">

                    <a class="navbar-brand home" href="{{ url('beranda') }}">
                        <img  src="{{ asset('img/logo.png') }}" alt="STKIP SUAR BANGLI" class="hidden-xs hidden-sm">
                        <img  src="{{ asset('img/logo.png') }}" alt="STKIP SUAR BANGLI" class="visible-xs visible-sm"><span class="sr-only">STKIP SUAR BANGLI</span>
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
                            <a href="{{ url('admin') }}" >Umum</a>
                        </li>
                        <li class="dropdown ">
                            <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown">Konten Management <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="{{ url('admin/content/slider') }}">Slider</a>
                                </li>
                                <li><a href="{{ url('admin/profil/1') }}">Profil</a>
                                </li>
                                <li><a href="{{ url('admin/program-studi/1') }}">Program Studi</a>
                                </li>
                                <li><a href="{{ url('admin/fasilitas/1') }}">Fasilitas</a>
                                </li>

                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown">Penelitian <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                           <li> <a href="{{ url('admin/penelitian/penelitian-pengabdian-masyarakat') }}" >Penelitian Dan Pengabdian Masyarakat</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown">Pelatihan Pariwisata<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li> <a href="{{ url('admin/pelatihan/lembaga-pelatihan-bits') }}" >Lembaga Pelatihan BITS</a></li>
                                <li> <a href="{{ url('admin/pelatihan/prodi-bits') }}" >Prodi Pelatihan BITS</a></li>
                            </ul>
                        </li>
                        <li class="dropdown ">
                            <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown">Akademik <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="{{ url('admin/akademik/pedoman-akademik/1') }}">Pedoman Akademik</a>
                                </li>
                                <li><a href="{{ url('admin/akademik/kalender-akademik') }}">Kalender Akademik</a>
                                </li>
                             
                                <li><a  href="{{ url('admin/akademik/ukm/1')}}">UKM</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="{{ url('admin/dosen') }}" >Dosen</a>
                        </li>
                         <li class="dropdown ">
                            <a href="javascript: void(0)" class="dropdown-toggle" data-toggle="dropdown">Berita, Agenda & Pengumuman <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                             <li>
                            <a href="{{ url('admin/berita') }}" >Berita</a>
                                </li>
                         <li >
                            <a href="{{ url('admin/agenda') }}" >Agenda</a>
                        </li>
                        <li >
                            <a href="{{ url('admin/pengumuman') }}" >Pengumuman</a>
                        </li>
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="{{ url('admin/kegiatan') }}" >Kegiatan </a>
                        </li>
                       
                        <li class="dropdown">
                            <a href="{{ url('admin/galeri') }}" >Galeri </a>
                        </li>
                        <li class="dropdown">
                            <a href="{{ url('admin/alumni') }}">Alumni </a>
                        </li>
                        <li class="dropdown">
                            <a href="{{ url('admin/logout') }}" >Logout</a>
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