<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ukm extends Model
{
    protected $table='ukm';
    protected $fillable=['jenis','keterangan','gambar'];
}
