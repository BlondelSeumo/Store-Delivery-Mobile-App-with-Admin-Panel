<div class='btn-group btn-group-sm'>
    @if(in_array($id,$myReviews))
        @can('productReviews.show')
            <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('productReviews.show', $id) }}" class='btn btn-link'>
                <i class="fa fa-eye"></i> </a>
        @endcan


        @can('productReviews.edit')
            <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.product_review_edit')}}" href="{{ route('productReviews.edit', $id) }}" class='btn btn-link'>
                <i class="fa fa-edit"></i> </a>
        @endcan

        @can('productReviews.destroy')
            {!! Form::open(['route' => ['productReviews.destroy', $id], 'method' => 'delete']) !!}
            {!! Form::button('<i class="fa fa-trash"></i>', [
            'type' => 'submit',
            'class' => 'btn btn-link text-danger',
            'onclick' => "return confirm('Are you sure?')"
            ]) !!}
            {!! Form::close() !!}
        @endcan
    @endif
</div>
