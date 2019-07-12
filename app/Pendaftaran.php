<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pendaftaran extends Model
{
    protected $table='pendaftaran';
    protected $fillable=['kode','status','nama','tempat_lahir','tgl_lahir','agama','jenis_kelamin','asal_sekolah','nohp','nama_ortu','tempat_lahir_ortu','tgl_lahir_ortu','pekerjaan_ortu','alamat_ortu','prodi','foto','email','bukti_pembayaran'];
    
}
