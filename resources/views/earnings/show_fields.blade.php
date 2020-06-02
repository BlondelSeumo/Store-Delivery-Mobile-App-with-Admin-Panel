<!-- Id Field -->
<div class="form-group row col-6">
  {!! Form::label('id', 'Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->id !!}</p>
  </div>
</div>

<!-- Market Id Field -->
<div class="form-group row col-6">
  {!! Form::label('market_id', 'Market Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->market_id !!}</p>
  </div>
</div>

<!-- Total Orders Field -->
<div class="form-group row col-6">
  {!! Form::label('total_orders', 'Total Orders:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->total_orders !!}</p>
  </div>
</div>

<!-- Total Earning Field -->
<div class="form-group row col-6">
  {!! Form::label('total_earning', 'Total Earning:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->total_earning !!}</p>
  </div>
</div>

<!-- Admin Earning Field -->
<div class="form-group row col-6">
  {!! Form::label('admin_earning', 'Admin Earning:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->admin_earning !!}</p>
  </div>
</div>

<!-- Market Earning Field -->
<div class="form-group row col-6">
  {!! Form::label('market_earning', 'Market Earning:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->market_earning !!}</p>
  </div>
</div>

<!-- Delivery Fee Field -->
<div class="form-group row col-6">
  {!! Form::label('delivery_fee', 'Delivery Fee:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->delivery_fee !!}</p>
  </div>
</div>

<!-- Tax Field -->
<div class="form-group row col-6">
  {!! Form::label('tax', 'Tax:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->tax !!}</p>
  </div>
</div>

<!-- Created At Field -->
<div class="form-group row col-6">
  {!! Form::label('created_at', 'Created At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->created_at !!}</p>
  </div>
</div>

<!-- Updated At Field -->
<div class="form-group row col-6">
  {!! Form::label('updated_at', 'Updated At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $earning->updated_at !!}</p>
  </div>
</div>

