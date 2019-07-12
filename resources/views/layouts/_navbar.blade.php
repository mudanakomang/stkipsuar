<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">

        <div class="navbar navbar-default yamm" role="navigation" id="navbar" style="padding-bottom: 14px">

            <div class="container">
                <div class="navbar-header">

                    <a class="navbar-brand logo" href="{{ url('beranda') }}">
                        <img  src="{{asset('img/logo.png')}}" alt="STKIP SUAR BANGLI" class="hidden-xs hidden-sm">
                        <img  src="{{asset('img/logo.png')}}" alt="STKIP SUAR BANGLI" class="visible-xs visible-sm"><span class="sr-only">STKIP SUAR BANGLI</span>
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
                                <li><a href="{{ url('profil/p/sambutan-ketua-yayasan') }}">Sambutan Ketua Yayasan Kresna Andhi Mandiri</a>
                                </li>
                                <li><a href="{{ url('profil/p/sambutan-ketua-stkip-suar-bangli') }}">Sambutan Ketua STKIP Suar Bangli</a>
                                </li>
                                <li><a href="{{ url('profil/p/sejarah-stkip-suar-bangli') }}">Sejarah STKIP Suar Bangli</a>
                                </li>
                                <li><a href="{{ url('profil/p/visi-misi') }}">Visi Misi</a>
                                </li>
                                <li><a href="{{ url('profil/p/logo') }}">Logo STKIP SUAR BANGLI</a>
                                </li>
                                <li><a href="{{ url('profil/p/struktur-organisasi') }}">Struktur Organisasi</a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Program Studi<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="{{ url('program-studi/p/pendidikan-bahasa-dan-sastra-indonesia') }}">Pendidikan Bahasa dan Sastra Indonesia</a>
                                </li>
                                <li><a href="{{ url('program-studi/p/pendidikan-bahasa-inggris') }}">Pendidikan Bahasa Inggris</a>
                                </li>
                                <li><a href="{{ url('program-studi/p/pendidikan-guru-sekolah-dasar') }}">Pendidikan Guru Sekolah Dasar (PGSD)</a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fasilitas <b class="caret"></b></a>
                            <ul class="dropdown-menu">

                                <li><a href="{{ url('fasilitas/f/ruang-kuliah') }}">Ruang Kuliah</a>
                                </li>
                                <li><a href="{{ url('fasilitas/f/ruang-administratsi') }}">Ruang Administrasi</a>
                                </li>
                                <li><a href="{{ url('fasilitas/f/ruang-laboratorium') }}">Ruang Laoratorium</a>
                                </li>
                                <li><a href="{{ url('fasilitas/f/ruang-perpustakaan') }}">Ruang Perpustakaan</a>
                                </li>
                                <li><a href="{{ url('fasilitas/f/kartu-mahasiswa') }}">Kartu Mahasiswa</a>
                                </li>
                                <li><a href="{{ url('fasilitas/f/free-wifi') }}">Free Wifi</a>
                                </li>
                                <li><a href="{{ url('fasilitas/f/beasiswa') }}">Beasiswa</a>
                                </li>
                                <li class="dropdown-submenu">
                                    <a class="test" href="#" aria-expanded="false">Repository STKIP Suar Bangli<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                      <li><a href="#">Skripsi</a></li>                                      
                                    </ul>
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
                                <li class="dropdown-submenu">
                                <a class="test" tabindex="-1" href="#">UKM<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                  <li><a tabindex="-1" href="#">Jurnalistik</a></li>
                                  <li><a tabindex="-1" href="#">Paduan Suara</a></li>
                                  </ul>
                                  </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Penelitian  <b class="caret"></b></a>
                            <ul class="dropdown-menu">

                                <li><a href="{{ url('penelitian/penelitian-pengabdian-masyarakat') }}">Penelitian Dan Pengabdian Masyarakat</a>
                                </li>
                                <li><a href="{{ url('https://jurnal.stkipsuarbangli.ac.id') }}" target="_blank">Jurnal Pendidikan Wahana Chitta</a>
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
                            <a href="{{ url('kegiatan') }}" >Kegiatan </a>
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