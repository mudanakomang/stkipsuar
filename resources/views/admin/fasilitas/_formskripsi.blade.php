@if($action=='add')
{!! Form::model($skripsi,['action'=>'FasilitasController@storeSkripsi','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($skripsi,['action'=>['FasilitasController@skripsiUpdate','id'=>$skripsi->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif

<div class="form-group">
    {!! Form::label('judul','Judul',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('judul',$skripsi->judul,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('judul') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('nama','Nama',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('nama',$skripsi->nama,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nama') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('nim','NIM',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('nim',$skripsi->nim,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nim') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('program','Program Studi',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::select('program',[''=>'Pilih Program Studi',
                                        'Pendidikan Bahasa dan Sastra Indonesia'=>'Pendidikan Bahasa dan Sastra Indonesia',
                                        'Pendidikan Bahasa Inggris'=>'Pendidikan Bahasa Inggris',
                                        'Pendidikan Guru Sekolah Dasar'=>'Pendidikan Guru Sekolah Dasar'],$skripsi->program,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('program') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('pembimbig1','Pembimbing I',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('pembimbig1',$skripsi->pembimbig1,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('pembimbig1') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('nidn1','NIDN Pembimbing I',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('nidn1',$skripsi->nidn1,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nidn1') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('pembimbig2','Pembimbing II',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('pembimbig2',$skripsi->pembimbig2,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('pembimbig2') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('nidn2','NIDN Pembimbing II',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::text('nidn2',$skripsi->nidn2,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nidn2') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('abstrak_text','Teks Abstrak',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-6">
        {!! Form::textarea('abstrak_text',$skripsi->abstrak_text,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('abstrak_text') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('abstrak_file','Pilih File Abstrak',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::file('abstrak_file') !!}
        <span class="text-danger">{{ $errors->first('abstrak_file') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('bab1','Pilih File Pendahuluan',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::file('bab1') !!}
        <span class="text-danger">{{ $errors->first('bab1') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('bab5','Pilih File Kesimpulan/Saran',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::file('bab5') !!}
        <span class="text-danger">{{ $errors->first('bab5') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tgl_terbit','Tanggal Terbit',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('tgl_terbit',\Carbon\Carbon::parse($skripsi->tgl_terbit)->format('d M Y'),['class'=>'form-control date-date ','id'=>'datetimepicker1']) !!}
        <span class="text-danger">{{ $errors->first('tgl_terbit') }}</span>
    </div>
</div>
<div class="form-group">
    <div class="col-sm-10 pull-right">
        {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
    </div>
 </div>
{{--  <div class="form-group">
    {!! Form::label('gambar','Pilih Gambar',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::file('gambar') !!}
        <span class="text-danger">{{ $errors->first('gambar') }}</span>
    </div>
</div>
@if(!empty($galeri->gambar))

<div class="form-group">
    {!! Form::label('','Gambar',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
      <img src="{{ asset('public/img/galeri').'/'.$galeri->gambar}}" alt="{{$galeri->gambar}}" width="150px;">
    
    </div>
</div>
@endif
<div class="form-group">
    {!! Form::label('keterangan','Keterangan',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('keterangan',$galeri->keterangan,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('keterangan') }}</span>
    </div>
</div>
<div class="form-group">
   <div class="col-sm-10 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>  --}}

{!! Form::close() !!}
@ckeditor('abstrak_text', ['height' => 300])
