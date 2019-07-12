<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Alumni extends Model
{
    protected $table='alumni';
    protected $fillable=['nim','nama','periode','jurusan','ipk'];
}
