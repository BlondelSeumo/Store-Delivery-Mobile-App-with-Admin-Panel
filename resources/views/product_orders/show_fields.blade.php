<!-- Id Field -->
<div class="form-group row col-6">
  {!! Form::label('id', 'Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->id !!}</p>
  </div>
</div>

<!-- Price Field -->
<div class="form-group row col-6">
  {!! Form::label('price', 'Price:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->price !!}</p>
  </div>
</div>

<!-- Quantity Field -->
<div class="form-group row col-6">
  {!! Form::label('quantity', 'Quantity:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->quantity !!}</p>
  </div>
</div>

<!-- Product Id Field -->
<div class="form-group row col-6">
  {!! Form::label('product_id', 'Product Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->product_id !!}</p>
  </div>
</div>

<!-- Options Field -->
<div class="form-group row col-6">
  {!! Form::label('options', 'Options:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->options !!}</p>
  </div>
</div>

<!-- Order Id Field -->
<div class="form-group row col-6">
  {!! Form::label('order_id', 'Order Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->order_id !!}</p>
  </div>
</div>

<!-- Created At Field -->
<div class="form-group row col-6">
  {!! Form::label('created_at', 'Created At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->created_at !!}</p>
  </div>
</div>

<!-- Updated At Field -->
<div class="form-group row col-6">
  {!! Form::label('updated_at', 'Updated At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $productOrder->updated_at !!}</p>
  </div>
</div>

