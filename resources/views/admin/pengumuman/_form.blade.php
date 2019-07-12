@if($action=='add')
{!! Form::model($pengumuman,['action'=>'PengumumanController@pengumumanStore','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($pengumuman,['action'=>['PengumumanController@pengumumanUpdate','id'=>$pengumuman->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif
<div class="form-group">
    {!! Form::label('judul','Judul',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('judul',$pengumuman->judul,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('judul') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('isi','Isi Pengumuman',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::textarea('isi',$pengumuman->isi,['class'=>'form-control','id'=>'isi']) !!}
        <span class="text-danger">{{ $errors->first('isi') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('gambar','Gambar',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::file('gambar') !!}
        <span class="text-danger">{{ $errors->first('gambar') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tgl','Tanggal',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('tgl',\Carbon\Carbon::parse($pengumuman->tgl)->format('d M Y'),['class'=>'form-control date-date ','id'=>'datetimepicker1','readonly']) !!}
        <span class="text-danger">{{ $errors->first('tgl') }}</span>
    </div>
</div>
<div class="form-group">
   <div class="col-sm-10 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>


{!! Form::close() !!}