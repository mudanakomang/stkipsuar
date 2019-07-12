@if($action=='add')
{!! Form::model($kegiatan,['action'=>'KegiatanController@kegiatanStore','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($kegiatan,['action'=>['KegiatanController@kegiatanUpdate','id'=>$kegiatan->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif
<div class="form-group">
    {!! Form::label('nama','Nama Kegiatan',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('nama',$kegiatan->nama,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nama') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('keterangan','Keterangan',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::textarea('keterangan',$kegiatan->keterangan,['class'=>'form-control','id'=>'keterangan']) !!}
        <span class="text-danger">{{ $errors->first('keterangan') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tgl','Tanggal',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('tgl',\Carbon\Carbon::parse($kegiatan->tgl)->format('d M Y'),['class'=>'form-control date-date ','id'=>'datetimepicker1','readonly']) !!}
        <span class="text-danger">{{ $errors->first('tgl') }}</span>
    </div>
</div>
<div class="form-group">
   <div class="col-sm-10 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>


{!! Form::close() !!}