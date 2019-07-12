<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
class DosenMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ( Auth::check() && Auth::user()->roles[0]->name == 'dosen' )
        {
            return $next($request);
        }

        return redirect('/dosen');
    }
}
