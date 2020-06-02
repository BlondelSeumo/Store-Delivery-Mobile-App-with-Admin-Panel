<!-- Id Field -->
<div class="form-group row col-6">
  {!! Form::label('id', 'Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->id !!}</p>
  </div>
</div>

<!-- Name Field -->
<div class="form-group row col-6">
  {!! Form::label('name', 'Name:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->name !!}</p>
  </div>
</div>

<!-- Image Field -->
<div class="form-group row col-6">
  {!! Form::label('image', 'Image:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->image !!}</p>
  </div>
</div>

<!-- Price Field -->
<div class="form-group row col-6">
  {!! Form::label('price', 'Price:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->price !!}</p>
  </div>
</div>

<!-- Discount Price Field -->
<div class="form-group row col-6">
  {!! Form::label('discount_price', 'Discount Price:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->discount_price !!}</p>
  </div>
</div>

<!-- Description Field -->
<div class="form-group row col-6">
  {!! Form::label('description', 'Description:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->description !!}</p>
  </div>
</div>

<!-- Ingredients Field -->
<div class="form-group row col-6">
  {!! Form::label('ingredients', 'Ingredients:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->ingredients !!}</p>
  </div>
</div>

<!-- Capacity Field -->
<div class="form-group row col-6">
  {!! Form::label('capacity', 'Capacity:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->capacity !!}</p>
  </div>
</div>

<!-- Featured Field -->
<div class="form-group row col-6">
  {!! Form::label('featured', 'Featured:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->featured !!}</p>
  </div>
</div>

<!-- Market Id Field -->
<div class="form-group row col-6">
  {!! Form::label('market_id', 'Market Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->market_id !!}</p>
  </div>
</div>

<!-- Category Id Field -->
<div class="form-group row col-6">
  {!! Form::label('category_id', 'Category Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->category_id !!}</p>
  </div>
</div>

<!-- Created At Field -->
<div class="form-group row col-6">
  {!! Form::label('created_at', 'Created At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->created_at !!}</p>
  </div>
</div>

<!-- Updated At Field -->
<div class="form-group row col-6">
  {!! Form::label('updated_at', 'Updated At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $product->updated_at !!}</p>
  </div>
</div>

