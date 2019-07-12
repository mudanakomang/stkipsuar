<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FotoKegiatan extends Model
{
    protected $table='foto_kegiatan';
    protected $fillable=['gambar','kegiatan_id'];
    
    public function kegiatan(){
        return $this->belongsToMany('\App\Kegiatan');
    }
}
