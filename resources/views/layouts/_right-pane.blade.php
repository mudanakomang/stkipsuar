 <div class="sidebar">
                  <aside class="news-small well well-sm" id="news-small" style="padding-bottom:10px;">
                    <header>
                        <h3>Berita Terbaru</h3>
                    </header> 
                    <div class="section-content">
                     @foreach (\App\Berita::orderBy('created_at','desc')->take(3)->get() as $key => $value)
                     <article>
                                
                                <header>
                                    <a href="{{url('berita/detail').'/'.$value->id}}">{{ $value->judul }}</a>
                                </header>
                                <figure class="date"><i class="fa fa-calendar-o"></i> {{ \Carbon\Carbon::parse($value->tglterbit)->format('d M Y')}}</figure>
                      </article><!-- /article -->
                   <hr>
                 @endforeach
                 <span><a class="btn btn-info btn-xs" href="{{ url('berita')}}">Semua Berita<i class="fa fa-arrow-right"></i></a></span>              
                           
                           
                     </div><!-- /.section-content -->
                
                </aside>
                 <aside class="news-small well well-sm " id="news-small"  style="padding-bottom:10px;">
                    <header>
                        <h3>Agenda Terbaru</h3>
                    </header> 
                    <div class="section-content">
                     @foreach (\App\Agenda::orderBy('created_at','desc')->take(3)->get() as $key => $value)
                     <article>
                                
                                <header>
                                    <a href="{{url('agenda/detail').'/'.$value->id}}">{{ $value->judul }}</a>
                                </header>
                                <figure class="date"><i class="fa fa-calendar-o"></i> {{ \Carbon\Carbon::parse($value->tgl)->format('d M Y')}}</figure>
                      </article><!-- /article -->
                   <hr>
                 @endforeach
                 <span><a class="btn btn-info btn-xs" href="{{ url('agenda')}}">Semua Agenda<i class="fa fa-arrow-right"></i></a></span>              
                           
                           
                     </div><!-- /.section-content -->
                
                </aside>

 <aside class="news-small well well-sm" id="news-small"  style="padding-bottom:10px;">
                    <header>
                        <h3>Pengumuman Terbaru</h3>
                    </header> 
                    <div class="section-content">
                     @foreach (\App\Pengumuman::orderBy('created_at','desc')->take(3)->get() as $key => $value)
                     <article>
                                
                                <header>
                                    <a href="{{url('pengumuman/detail').'/'.$value->id}}">{{ $value->judul }}</a>
                                </header>
                                <figure class="date"><i class="fa fa-calendar-o"></i> {{ \Carbon\Carbon::parse($value->tgl)->format('d M Y')}}</figure>
                      </article><!-- /article -->
                   <hr>
                 @endforeach
                 <span><a class="btn btn-info btn-xs" href="{{ url('pengumuman')}}">Semua Pengumuman<i class="fa fa-arrow-right"></i></a></span>              
                           
                           
                     </div><!-- /.section-content -->
                
                </aside>

</div>
