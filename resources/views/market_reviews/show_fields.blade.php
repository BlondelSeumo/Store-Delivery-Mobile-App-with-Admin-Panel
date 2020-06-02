<!-- Id Field -->
<div class="form-group row col-6">
  {!! Form::label('id', 'Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $marketReview->id !!}</p>
  </div>
</div>

<!-- Review Field -->
<div class="form-group row col-6">
  {!! Form::label('review', 'Review:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $marketReview->review !!}</p>
  </div>
</div>

<!-- Rate Field -->
<div class="form-group row col-6">
  {!! Form::label('rate', 'Rate:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $marketReview->rate !!}</p>
  </div>
</div>

<!-- User Id Field -->
<div class="form-group row col-6">
  {!! Form::label('user_id', 'User Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $marketReview->user_id !!}</p>
  </div>
</div>

<!-- Market Id Field -->
<div class="form-group row col-6">
  {!! Form::label('market_id', 'Market Id:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $marketReview->market_id !!}</p>
  </div>
</div>

<!-- Created At Field -->
<div class="form-group row col-6">
  {!! Form::label('created_at', 'Created At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $marketReview->created_at !!}</p>
  </div>
</div>

<!-- Updated At Field -->
<div class="form-group row col-6">
  {!! Form::label('updated_at', 'Updated At:', ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <p>{!! $marketReview->updated_at !!}</p>
  </div>
</div>

