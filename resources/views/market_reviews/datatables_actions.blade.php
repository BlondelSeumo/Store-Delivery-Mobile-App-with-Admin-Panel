<div class='btn-group btn-group-sm'>
    @if(in_array($id,$myReviews))
        @can('marketReviews.show')
            <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('marketReviews.show', $id) }}" class='btn btn-link'>
                <i class="fa fa-eye"></i> </a>
        @endcan

        @can('marketReviews.edit')
            <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.market_review_edit')}}" href="{{ route('marketReviews.edit', $id) }}" class='btn btn-link'>
                <i class="fa fa-edit"></i> </a>
        @endcan

        @can('marketReviews.destroy')
            {!! Form::open(['route' => ['marketReviews.destroy', $id], 'method' => 'delete']) !!}
            {!! Form::button('<i class="fa fa-trash"></i>', [
            'type' => 'submit',
            'class' => 'btn btn-link text-danger',
            'onclick' => "return confirm('Are you sure?')"
            ]) !!}
            {!! Form::close() !!}
        @endcan
    @endif
</div>
