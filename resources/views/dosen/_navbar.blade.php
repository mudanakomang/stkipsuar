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
                            <a href="{{ url('dosen') }}" >Profil Dosen</a>
                        </li>
                        <li class="dropdown">
                            <a href="{{ url('dosen/password') }}" >Ganti Password</a>
                        </li>
                        <li class="dropdown">
                            <a href="{{ url('dosen/files') }}" >Upload File</a>
                        </li>
                        <li class="dropdown">
                            <a href="{{ url('dosen/logout') }}" >Logout</a>
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