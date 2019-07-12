@if($action=='add')
{!! Form::model($berita,['action'=>'BeritaController@beritaStore','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($berita,['action'=>['BeritaController@beritaUpdate','id'=>$berita->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif
<div class="form-group">
    {!! Form::label('judul','Judul',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('judul',$berita->judul,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('judul') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('isi','Isi Berita',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::textarea('isi',$berita->isi,['class'=>'form-control','id'=>'isi']) !!}
        <span class="text-danger">{{ $errors->first('isi') }}</span>
    </div>
</div>
{!! Form::hidden('penerbit', Auth::user()->username) !!}
<div class="form-group">
    {!! Form::label('gambar','Gambar',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::file('gambar') !!}
        <span class="text-danger">{{ $errors->first('gambar') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tglterbit','Tanggal Terbit',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('tglterbit',\Carbon\Carbon::parse($berita->tglterbit)->format('d M Y'),['class'=>'form-control date-date ','id'=>'datetimepicker1','readonly']) !!}
        <span class="text-danger">{{ $errors->first('tglterbit') }}</span>
    </div>
</div>
<div class="form-group">
   <div class="col-sm-10 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>


{!! Form::close() !!}