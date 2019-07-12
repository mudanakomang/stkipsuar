<?php

namespace App\Providers;

use App\GeneralSettings;
use Illuminate\Support\ServiceProvider;
use App\Berita;
use App\Galeri;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //General setting all pages
       $general=GeneralSettings::find(1);
       $berita=Berita::all();
       $galeries=Galeri::all();
       if (count($galeries)>=6){
           $galeries->random(6);
       }
       view()->share('general',$general);
       view()->share('berita',$berita);
       view()->share('galeries',$galeries);
       
       
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
