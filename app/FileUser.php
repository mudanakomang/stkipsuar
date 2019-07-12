<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FileUser extends Model
{
    protected $table='files';
    protected $fillable=['filename','keterangan'];
    
    public function user(){
        return $this->belongsToMany('\App\User','file_user','file_id','user_id');
    }
}