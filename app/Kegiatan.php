<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kegiatan extends Model
{
    protected $table='kegiatan';
    protected $fillable=['nama','keterangan','tgl'];
    
    public function foto(){
        return $this->belongsToMany('\App\FotoKegiatan');
    }
}
