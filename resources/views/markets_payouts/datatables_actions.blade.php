<div class='btn-group btn-group-sm'>
  @can('marketsPayouts.show')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('marketsPayouts.show', $id) }}" class='btn btn-link'>
    <i class="fa fa-eye"></i>
  </a>
  @endcan

  @can('marketsPayouts.edit')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.markets_payout_edit')}}" href="{{ route('marketsPayouts.edit', $id) }}" class='btn btn-link'>
    <i class="fa fa-edit"></i>
  </a>
  @endcan

  @can('marketsPayouts.destroy')
{!! Form::open(['route' => ['marketsPayouts.destroy', $id], 'method' => 'delete']) !!}
  {!! Form::button('<i class="fa fa-trash"></i>', [
  'type' => 'submit',
  'class' => 'btn btn-link text-danger',
  'onclick' => "return confirm('Are you sure?')"
  ]) !!}
{!! Form::close() !!}
  @endcan
</div>
