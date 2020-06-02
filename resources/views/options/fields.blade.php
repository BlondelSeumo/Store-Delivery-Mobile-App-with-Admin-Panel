@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
<!-- Name Field -->
<div class="form-group row ">
  {!! Form::label('name', trans("lang.option_name"), ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.option_name_placeholder")]) !!}
    <div class="form-text text-muted">
      {{ trans("lang.option_name_help") }}
    </div>
  </div>
</div>

<!-- Image Field -->
<div class="form-group row">
  {!! Form::label('image', trans("lang.option_image"), ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    <div style="width: 100%" class="dropzone image" id="image" data-field="image">
      <input type="hidden" name="image">
    </div>
    <a href="#loadMediaModal" data-dropzone="image" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-{{setting('theme_color','primary')}} btn-sm float-right mt-1">{{ trans('lang.media_select')}}</a>
    <div class="form-text text-muted w-50">
      {{ trans("lang.option_image_help") }}
    </div>
  </div>
</div>
@prepend('scripts')
<script type="text/javascript">
    var var1586170590554938530ble = '';
    @if(isset($option) && $option->hasMedia('image'))
    var1586170590554938530ble = {
        name: "{!! $option->getFirstMedia('image')->name !!}",
        size: "{!! $option->getFirstMedia('image')->size !!}",
        type: "{!! $option->getFirstMedia('image')->mime_type !!}",
        collection_name: "{!! $option->getFirstMedia('image')->collection_name !!}"};
    @endif
    var dz_var1586170590554938530ble = $(".dropzone.image").dropzone({
        url: "{!!url('uploads/store')!!}",
        addRemoveLinks: true,
        maxFiles: 1,
        init: function () {
        @if(isset($option) && $option->hasMedia('image'))
            dzInit(this,var1586170590554938530ble,'{!! url($option->getFirstMediaUrl('image','thumb')) !!}')
        @endif
        },
        accept: function(file, done) {
            dzAccept(file,done,this.element,"{!!config('medialibrary.icons_folder')!!}");
        },
        sending: function (file, xhr, formData) {
            dzSending(this,file,formData,'{!! csrf_token() !!}');
        },
        maxfilesexceeded: function (file) {
            dz_var1586170590554938530ble[0].mockFile = '';
            dzMaxfile(this,file);
        },
        complete: function (file) {
            dzComplete(this, file, var1586170590554938530ble, dz_var1586170590554938530ble[0].mockFile);
            dz_var1586170590554938530ble[0].mockFile = file;
        },
        removedfile: function (file) {
            dzRemoveFile(
                file, var1586170590554938530ble, '{!! url("options/remove-media") !!}',
                'image', '{!! isset($option) ? $option->id : 0 !!}', '{!! url("uplaods/clear") !!}', '{!! csrf_token() !!}'
            );
        }
    });
    dz_var1586170590554938530ble[0].mockFile = var1586170590554938530ble;
    dropzoneFields['image'] = dz_var1586170590554938530ble;
</script>
@endprepend

<!-- Description Field -->
<div class="form-group row ">
  {!! Form::label('description', trans("lang.option_description"), ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
     trans("lang.option_description_placeholder")  ]) !!}
    <div class="form-text text-muted">{{ trans("lang.option_description_help") }}</div>
  </div>
</div>
</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">

<!-- Price Field -->
<div class="form-group row ">
  {!! Form::label('price', trans("lang.option_price"), ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
      {!! Form::number('price', null,  ['class' => 'form-control','step'=>"any",'placeholder'=>  trans("lang.option_price_placeholder")]) !!}
    <div class="form-text text-muted">
      {{ trans("lang.option_price_help") }}
    </div>
  </div>
</div>

<!-- Product Id Field -->
<div class="form-group row ">
  {!! Form::label('product_id', trans("lang.option_product_id"),['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::select('product_id', $product, null, ['class' => 'select2 form-control']) !!}
    <div class="form-text text-muted">{{ trans("lang.option_product_id_help") }}</div>
  </div>
</div>


<!-- Option Group Id Field -->
<div class="form-group row ">
  {!! Form::label('option_group_id', trans("lang.option_option_group_id"),['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::select('option_group_id', $optionGroup, null, ['class' => 'select2 form-control']) !!}
    <div class="form-text text-muted">{{ trans("lang.option_option_group_id_help") }}</div>
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
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.option')}}</button>
  <a href="{!! route('options.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
