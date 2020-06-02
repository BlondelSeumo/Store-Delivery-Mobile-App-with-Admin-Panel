@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
<!-- Product Id Field -->
<div class="form-group row ">
  {!! Form::label('product_id', trans("lang.favorite_product_id"),['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::select('product_id', $product, null, ['class' => 'select2 form-control']) !!}
    <div class="form-text text-muted">{{ trans("lang.favorite_product_id_help") }}</div>
  </div>
</div>


<!-- Options Field -->
<div class="form-group row ">
  {!! Form::label('options[]', trans("lang.favorite_options"),['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::select('options[]', $option, $optionsSelected, ['class' => 'select2 form-control' , 'multiple'=>'multiple']) !!}
    <div class="form-text text-muted">{{ trans("lang.favorite_options_help") }}</div>
  </div>
</div>

</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">

<!-- User Id Field -->
<div class="form-group row ">
  {!! Form::label('user_id', trans("lang.favorite_user_id"),['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::select('user_id', $user, null, ['class' => 'select2 form-control']) !!}
    <div class="form-text text-muted">{{ trans("lang.favorite_user_id_help") }}</div>
  </div>
</div>

</div>
@if($customFields)
<div class="clearfix"></div>
<div class="col-12 custom-field-container">
  <h5 class="col-12 pb-4">{!! trans('lang.custom_field_plural') !!}</h5>
  {!! $customFields !!}
</div>
@endif
<!-- Submit Field -->
<div class="form-group col-12 text-right">
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.favorite')}}</button>
  <a href="{!! route('favorites.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
