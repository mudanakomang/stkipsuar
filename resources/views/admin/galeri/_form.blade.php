@if($action=='add')
{!! Form::model($galeri,['action'=>'GaleriController@galeriStore','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($galeri,['action'=>['GaleriController@galeriUpdate','id'=>$galeri->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif


<div class="form-group">
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
</div>

{!! Form::close() !!}