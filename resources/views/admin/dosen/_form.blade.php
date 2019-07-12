@if($action=='add')
{!! Form::model($dosen,['action'=>'DosenController@dosenStore','class'=>'form-horizontal','files'=>'true']) !!}
@else
    {!! Form::model($dosen,['action'=>['DosenController@dosenUpdate','id'=>$dosen->id],'class'=>'form-horizontal','files'=>'true']) !!}
@endif
<div class="form-group">
    {!! Form::label('nik','ID Dosen',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('nik',$dosen->nik,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('nik') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('name','Nama Dosen',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('name',$dosen->name,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('name') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('alamat','Alamat Dosen',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('alamat',$dosen->alamat,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('alamat') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tmpt_lahir','Tempat Lahir',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('tmpt_lahir',$dosen->tmpt_lahir,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('tmpt_lahir') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('tgl_lahir','Tanggal Lahir',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::text('tgl_lahir',$dosen->tgl_lahir,['class'=>'form-control date-date ','id'=>'datetimepicker1','readonly']) !!}
        <span class="text-danger">{{ $errors->first('tgl_lahir') }}</span>
    </div>
</div>
<div class="form-group">
    {!! Form::label('email','Email',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::email('email',$dosen->email,['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('email') }}</span>
        <span class="note">Gunakan alamat email yang valid</span>
    </div>
</div>
@if($action=='add')
<div class="form-group">
    {!! Form::label('password','Password',['class'=>'col-sm-2 control-label']) !!}
    <div class="col-sm-4">
        {!! Form::password('password',['class'=>'form-control']) !!}
        <span class="text-danger">{{ $errors->first('password') }}</span>
    </div>
</div>
@endif

<div class="form-group">
   <div class="col-sm-10 pull-right">
       {!! Form::submit('Simpan',['class'=>'btn btn-success']) !!}
   </div>
</div>


{!! Form::close() !!}