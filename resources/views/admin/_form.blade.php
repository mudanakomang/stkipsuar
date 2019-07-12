@if($action=='add')
{!! Form::model($sliders,['action'=>'AdminController@sliderStore','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($sliders,['action'=>['AdminController@sliderUpdate','id'=>$sliders->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif
<div class="form-group">
    {!! Form::label('judul','Judul',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('judul',$sliders->judul,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('judul') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('deskripsi','Deskripsi',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::textarea('deskripsi',$sliders->deskripsi,['class'=>'form-control','id'=>'deskripsi']) !!}
        <span class="text-danger">{{ $errors->first('deskripsi') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('gambar','Gambar',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::file('gambar',['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('gambar') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('status','Status',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::select('status',['1'=>'Aktif','0'=>'Nonaktif'],'1',['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('status') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('link','Link',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('link',$sliders->link,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('link') }}</span>
    </div>
</div>
<div class="form-group">
   <div class="col-sm-10 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>
@ckeditor('deskripsi', ['height' => 150])

{!! Form::close() !!}