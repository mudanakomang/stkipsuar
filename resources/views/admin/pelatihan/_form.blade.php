@if($action=='add')
{!! Form::model($prodi,['action'=>'PelatihanController@prodiStore','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($prodi,['action'=>['PelatihanController@prodiUpdate','id'=>$prodi->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif
<div class="form-group">
    {!! Form::label('prodi','Nama Prodi',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::text('prodi',$prodi->prodi,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('prodi') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('keterangan','Kerterangan',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-8">
        {!! Form::textarea('keterangan',$prodi->keterangan,['class'=>'form-control','id'=>'keterangan']) !!}
        <span class="text-danger">{{ $errors->first('keterangan') }}</span>
    </div>
</div>
<div class="form-group">
   <div class="col-sm-10 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>
@ckeditor('keterangan', ['height' => 200])

{!! Form::close() !!}