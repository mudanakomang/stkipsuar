{!! Form::model($pendaftaran,['action'=>'PendaftaranController@pendaftaran1Store','class'=>'form-horizontal','files'=>'true']) !!}

<div class="form-group">
    {!! Form::label('kode','Nomor Pendaftaran',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('kode',$id,['class'=>'form-control','disabled'=>'disabled']) !!}
        <span class="text-danger">{{ $errors->first('kode') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('nama','Nama Calon Mahasiswa',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('nama',$pendaftaran->nama,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nama') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tempat_lahir','Tempat Lahir',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('tempat_lahir',$pendaftaran->tempat_lahir,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('tempat_lahir') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tgl_lahir','Tanggal Lahir',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('tgl_lahir',\Carbon\Carbon::parse($pendaftaran->tgl_lahir)->format('d M Y'),['class'=>'form-control date-date datepick','id'=>'datetimepicker1']) !!}
        <span class="text-danger">{{ $errors->first('tgl_lahir') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('agama','Agama',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::select('agama',[''=>'','Hindu'=>'Hindu','Budha'=>'Budha','Islam'=>'Islam','Kristen'=>'Kristen','Lain-Lain'=>'Lain-Lain'],isset($pendaftaran->agama) ? $pendaftaran->agama : null,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('agama') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('jenis_kelamin','Jenis Kelamin',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::radio('jenis_kelamin','Laki-Laki') !!} Laki-Laki <br>
        {!! Form::radio('jenis_kelamin','Perempuan') !!} Perempuan<br>
        <span class="text-danger">{{ $errors->first('jenis_kelamin') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('asal_sekolah','Sekolah Asal',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('asal_sekolah',$pendaftaran->asal_sekolah,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('asal_sekolah') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('nohp','Nomor HP',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('nohp',$pendaftaran->nohp,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nohp') }}</span>
    </div>
</div> 
<div class="form-group">
    {!! Form::label('email','Alamat Email (Wajib)',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('email',$pendaftaran->email,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('email') }}</span>
    </div>
</div> 
<div class="form-group">
    {!! Form::label('nama_ortu','Nama Orang Tua',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('nama_ortu',$pendaftaran->nama_ortu,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nama_ortu') }}</span>
    </div>
</div> 
<div class="form-group">
    {!! Form::label('tempat_lahir_ortu','Tempat Lahir Orang Tua',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('tempat_lahir_ortu',$pendaftaran->tempat_lahir_ortu,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('tempat_lahir_ortu') }}</span>
    </div>
</div> 
<div class="form-group">
    {!! Form::label('tgl_lahir_ortu','Tanggal Lahir Orang Tua',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('tgl_lahir_ortu',\Carbon\Carbon::parse($pendaftaran->tgl_lahir_ortu)->format('d M Y'),['class'=>'form-control date-date datepick','id'=>'datetimepicker2']) !!}
        <span class="text-danger">{{ $errors->first('tgl_lahir_ortu') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('pekerjaan_ortu','Pekerjaan Orang Tua',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('pekerjaan_ortu',$pendaftaran->pekerjaan_ortu,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('pekerjaan_ortu') }}</span>
    </div>
</div> 
<div class="form-group">
    {!! Form::label('alamat_ortu','Alamat Orang Tua',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('alamat_ortu',$pendaftaran->alamat_ortu,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('alamat_ortu') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('prodi','Jurusan (Boleh dipilih 2 Jurusan)',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
         {!! Form::checkbox('prodi[]','Pendidikan Bahasa Inggris',isset($pendaftaran->prodi) ? "checked" : "" ,['class'=>'prodi'] ) !!} Pendidikan Bahasa Inggris <br>
         {!! Form::checkbox('prodi[]','Pendidikan Bahasa dan Sastra Indonesia',isset($pendaftaran->prodi) ? "checked" : "",['class'=>'prodi'] ) !!} Pendidikan Bahasa dan Sastra Indonesia <br>
         {!! Form::checkbox('prodi[]','Pendidikan Guru SD (PGSD)',isset($pendaftaran->prodi) ? "checked" : "",['class'=>'prodi'] ) !!} Pendidikan Guru Sekolah Dasar (PGSD) <br>
        <span class="text-danger">{{ $errors->first('prodi') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('foto','Pas Foto',['class'=>'col-sm-3 control-label']) !!}
    <div class="col-sm-6">
         {!! Form::file('foto') !!} 
        
        <span class="text-danger">{{ $errors->first('foto') }}</span>
    </div>
</div>
<div class="form-group">
   <div class="col-sm-9 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>


{!! Form::close() !!}