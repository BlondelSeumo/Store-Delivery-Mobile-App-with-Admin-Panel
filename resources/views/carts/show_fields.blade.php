<!-- Id Field -->
<div class="form-group row col-6">
  {!! Form::label('id', 'Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $cart->id !!}</p>
  </div>
</div>

<!-- Product Id Field -->
<div class="form-group row col-6">
  {!! Form::label('product_id', 'Product Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $cart->product_id !!}</p>
  </div>
</div>

<!-- User Id Field -->
<div class="form-group row col-6">
  {!! Form::label('user_id', 'User Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $cart->user_id !!}</p>
  </div>
</div>

<!-- Options Field -->
<div class="form-group row col-6">
  {!! Form::label('options', 'Options:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $cart->options !!}</p>
  </div>
</div>

<!-- Quantity Field -->
<div class="form-group row col-6">
  {!! Form::label('quantity', 'Quantity:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $cart->quantity !!}</p>
  </div>
</div>

<!-- Created At Field -->
<div class="form-group row col-6">
  {!! Form::label('created_at', 'Created At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $cart->created_at !!}</p>
  </div>
</div>

<!-- Updated At Field -->
<div class="form-group row col-6">
  {!! Form::label('updated_at', 'Updated At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $cart->updated_at !!}</p>
  </div>
</div>

