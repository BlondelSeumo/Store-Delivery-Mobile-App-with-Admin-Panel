@can('dashboard')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard*') ? 'active' : '' }}" href="{!! url('dashboard') !!}">@if($icons)
                <i class="nav-icon fa fa-dashboard"></i>@endif
            <p>{{trans('lang.dashboard')}}</p></a>
    </li>
@endcan

@can('favorites.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('favorites*') ? 'active' : '' }}" href="{!! route('favorites.index') !!}">@if($icons)
                <i class="nav-icon fa fa-heart"></i>@endif<p>{{trans('lang.favorite_plural')}}</p></a>
    </li>
@endcan

<li class="nav-header">{{trans('lang.app_management')}}</li>

@can('fields.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('fields*') ? 'active' : '' }}" href="{!! route('fields.index') !!}">@if($icons)<i class="nav-icon fa fa-tasks"></i>@endif<p>{{trans('lang.field_plural')}}</p></a>
    </li>
@endcan

@can('markets.index')
    <li class="nav-item has-treeview {{ (Request::is('markets*') || Request::is('galleries*') || Request::is('marketReviews*')) && !Request::is('marketsPayouts*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ (Request::is('markets*') || Request::is('galleries*') || Request::is('marketReviews*')) && !Request::is('marketsPayouts*')? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-shopping-basket"></i>@endif
            <p>{{trans('lang.market_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            @can('markets.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('markets*') ? 'active' : '' }}" href="{!! route('markets.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-reorder"></i>@endif<p>{{trans('lang.market_plural')}}</p></a>
                </li>
            @endcan
            @can('galleries.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('galleries*') ? 'active' : '' }}" href="{!! route('galleries.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-image"></i>@endif<p>{{trans('lang.gallery_plural')}}</p></a>
                </li>
            @endcan
            @can('marketReviews.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('marketReviews*') ? 'active' : '' }}" href="{!! route('marketReviews.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-comments"></i>@endif<p>{{trans('lang.market_review_plural')}}</p></a>
                </li>
            @endcan
        </ul>
    </li>
@endcan

@can('categories.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('categories*') ? 'active' : '' }}" href="{!! route('categories.index') !!}">@if($icons)
                <i class="nav-icon fa fa-folder"></i>@endif<p>{{trans('lang.category_plural')}}</p></a>
    </li>
@endcan

@can('products.index')
    <li class="nav-item has-treeview {{ Request::is('products*') || Request::is('options*') || Request::is('optionGroups*') || Request::is('productReviews*') || Request::is('nutrition*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{  Request::is('products*') || Request::is('options*') || Request::is('optionGroups*') || Request::is('productReviews*') || Request::is('nutrition*') ? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-archive"></i>@endif
            <p>{{trans('lang.product_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            @can('products.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('products*') ? 'active' : '' }}" href="{!! route('products.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-archive"></i>@endif
                        <p>{{trans('lang.product_plural')}}</p></a>
                </li>
            @endcan
            @can('optionGroups.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('optionGroups*') ? 'active' : '' }}" href="{!! route('optionGroups.index') !!}">@if($icons)<i class="nav-icon fa fa-plus-square"></i>@endif<p>{{trans('lang.option_group_plural')}}</p></a>
                </li>
            @endcan
            @can('options.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('options*') ? 'active' : '' }}" href="{!! route('options.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-plus-square-o"></i>@endif<p>{{trans('lang.option_plural')}}</p></a>
                </li>
            @endcan

            @can('productReviews.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('productReviews*') ? 'active' : '' }}" href="{!! route('productReviews.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-comments"></i>@endif<p>{{trans('lang.product_review_plural')}}</p></a>
                </li>
            @endcan

        </ul>
    </li>
@endcan

@can('orders.index')
    <li class="nav-item has-treeview {{ Request::is('orders*') || Request::is('orderStatuses*') || Request::is('deliveryAddresses*')? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('orders*') || Request::is('orderStatuses*') || Request::is('deliveryAddresses*')? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-shopping-bag"></i>@endif
            <p>{{trans('lang.order_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">

            @can('orders.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('orders*') ? 'active' : '' }}" href="{!! route('orders.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-shopping-bag"></i>@endif<p>{{trans('lang.order_plural')}}</p></a>
                </li>
            @endcan
            @can('orderStatuses.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('orderStatuses*') ? 'active' : '' }}" href="{!! route('orderStatuses.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-server"></i>@endif<p>{{trans('lang.order_status_plural')}}</p></a>
                </li>
            @endcan

                @can('deliveryAddresses.index')
                    <li class="nav-item">
                        <a class="nav-link {{ Request::is('deliveryAddresses*') ? 'active' : '' }}" href="{!! route('deliveryAddresses.index') !!}">@if($icons)<i class="nav-icon fa fa-map"></i>@endif<p>{{trans('lang.delivery_address_plural')}}</p></a>
                    </li>
                @endcan

        </ul>
    </li>
@endcan


@can('faqs.index')
    <li class="nav-item has-treeview {{ Request::is('faqCategories*') || Request::is('faqs*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('faqs*') || Request::is('faqCategories*') ? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-support"></i>@endif
            <p>{{trans('lang.faq_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            @can('faqCategories.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('faqCategories*') ? 'active' : '' }}" href="{!! route('faqCategories.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-folder"></i>@endif<p>{{trans('lang.faq_category_plural')}}</p></a>
                </li>
            @endcan

            @can('faqs.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('faqs*') ? 'active' : '' }}" href="{!! route('faqs.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-question-circle"></i>@endif
                        <p>{{trans('lang.faq_plural')}}</p></a>
                </li>
            @endcan
        </ul>
    </li>
@endcan

<li class="nav-header">{{trans('lang.app_setting')}}</li>
@can('medias')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('medias*') ? 'active' : '' }}" href="{!! url('medias') !!}">@if($icons)<i class="nav-icon fa fa-picture-o"></i>@endif
            <p>{{trans('lang.media_plural')}}</p></a>
    </li>
@endcan

@can('payments.index')
    <li class="nav-item has-treeview {{ Request::is('drivers*') || Request::is('earnings*') || Request::is('driversPayouts*') || Request::is('marketsPayouts*') || Request::is('payments*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('drivers*') || Request::is('earnings*') || Request::is('driversPayouts*') || Request::is('marketsPayouts*') || Request::is('payments*') ? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-credit-card"></i>@endif
            <p>{{trans('lang.payment_plural')}}<i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">

            @can('payments.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('payments*') ? 'active' : '' }}" href="{!! route('payments.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-money"></i>@endif<p>{{trans('lang.payment_plural')}}</p></a>
                </li>
            @endcan

            @can('drivers.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('drivers*') ? 'active' : '' }}" href="{!! route('drivers.index') !!}">@if($icons)<i class="nav-icon fa fa-car"></i>@endif<p>{{trans('lang.driver_plural')}} <span class="right badge badge-danger">New</span> </p></a>
                </li>
            @endcan

            @can('earnings.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('earnings*') ? 'active' : '' }}" href="{!! route('earnings.index') !!}">@if($icons)<i class="nav-icon fa fa-money"></i>@endif<p>{{trans('lang.earning_plural')}} <span class="right badge badge-danger">New</span> </p></a>
                </li>
            @endcan

            @can('driversPayouts.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('driversPayouts*') ? 'active' : '' }}" href="{!! route('driversPayouts.index') !!}">@if($icons)<i class="nav-icon fa fa-dollar"></i>@endif<p>{{trans('lang.drivers_payout_plural')}}</p></a>
                </li>
            @endcan

            @can('marketsPayouts.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('marketsPayouts*') ? 'active' : '' }}" href="{!! route('marketsPayouts.index') !!}">@if($icons)<i class="nav-icon fa fa-dollar"></i>@endif<p>{{trans('lang.markets_payout_plural')}}</p></a>
                </li>
            @endcan

        </ul>
    </li>
@endcan

@can('app-settings')
    <li class="nav-item has-treeview {{ Request::is('settings/mobile*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('settings/mobile*') ? 'active' : '' }}">
            @if($icons)<i class="nav-icon fa fa-mobile"></i>@endif
            <p>
                {{trans('lang.mobile_menu')}}
                <i class="right fa fa-angle-left"></i>
            </p></a>
        <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="{!! url('settings/mobile/globals') !!}" class="nav-link {{  Request::is('settings/mobile/globals*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-cog"></i> @endif <p>{{trans('lang.app_setting_globals')}} <span class="right badge badge-danger">New</span> </p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{!! url('settings/mobile/colors') !!}" class="nav-link {{  Request::is('settings/mobile/colors*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-pencil"></i> @endif <p>{{trans('lang.mobile_colors')}} <span class="right badge badge-danger">New</span> </p>
                </a>
            </li>
        </ul>

    </li>
    <li class="nav-item has-treeview {{
    (Request::is('settings*') ||
     Request::is('menu*') ||
      Request::is('notificationTypes*') ||
       Request::is('currencies*')) && !Request::is('settings/mobile*')
        ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{
        (Request::is('settings*') ||
         Request::is('currencies*') ||
          Request::is('notificationTypes*')) && !Request::is('settings/mobile*')
          ? 'active' : '' }}"> @if($icons)<i class="nav-icon fa fa-cogs"></i>@endif
            <p>{{trans('lang.app_setting')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="{!! url('settings/app/globals') !!}" class="nav-link {{  Request::is('settings/app/globals*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-cog"></i> @endif <p>{{trans('lang.app_setting_globals')}}</p>
                </a>
            </li>

            @can('users.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('settings/users*') ? 'active' : '' }}" href="{!! route('users.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-users"></i>@endif
                        <p>{{trans('lang.user_plural')}}</p></a>
                </li>
            @endcan

            <li class="nav-item has-treeview {{ Request::is('settings/permissions*') || Request::is('settings/roles*') ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ Request::is('settings/permissions*') || Request::is('settings/roles*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-user-secret"></i>@endif
                    <p>
                        {{trans('lang.permission_menu')}}
                        <i class="right fa fa-angle-left"></i>
                    </p></a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a class="nav-link {{ Request::is('settings/permissions') ? 'active' : '' }}" href="{!! route('permissions.index') !!}">
                            @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                            <p>{{trans('lang.permission_table')}}</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ Request::is('settings/permissions/create') ? 'active' : '' }}" href="{!! route('permissions.create') !!}">
                            @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                            <p>{{trans('lang.permission_create')}}</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ Request::is('settings/roles') ? 'active' : '' }}" href="{!! route('roles.index') !!}">
                            @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                            <p>{{trans('lang.role_table')}}</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ Request::is('settings/roles/create') ? 'active' : '' }}" href="{!! route('roles.create') !!}">
                            @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                            <p>{{trans('lang.role_create')}}</p>
                        </a>
                    </li>
                </ul>

            </li>

            <li class="nav-item">
                <a class="nav-link {{ Request::is('settings/customFields*') ? 'active' : '' }}" href="{!! route('customFields.index') !!}">@if($icons)
                        <i class="nav-icon fa fa-list"></i>@endif<p>{{trans('lang.custom_field_plural')}}</p></a>
            </li>


            <li class="nav-item">
                <a href="{!! url('settings/app/localisation') !!}" class="nav-link {{  Request::is('settings/app/localisation*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-language"></i> @endif <p>{{trans('lang.app_setting_localisation')}}</p></a>
            </li>
            <li class="nav-item">
                <a href="{!! url('settings/translation/en') !!}" class="nav-link {{ Request::is('settings/translation*') ? 'active' : '' }}">
                    @if($icons) <i class="nav-icon fa fa-language"></i> @endif <p>{{trans('lang.app_setting_translation')}}</p></a>
            </li>
            @can('currencies.index')
            <li class="nav-item">
              <a class="nav-link {{ Request::is('currencies*') ? 'active' : '' }}" href="{!! route('currencies.index') !!}">@if($icons)<i class="nav-icon fa fa-dollar"></i>@endif<p>{{trans('lang.currency_plural')}}</p></a>
            </li>
            @endcan

            <li class="nav-item">
                <a href="{!! url('settings/app/payment') !!}" class="nav-link {{  Request::is('settings/app/payment*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-credit-card"></i> @endif <p>{{trans('lang.app_setting_payment')}}</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{!! url('settings/app/social') !!}" class="nav-link {{  Request::is('settings/app/social*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-globe"></i> @endif <p>{{trans('lang.app_setting_social')}}</p>
                </a>
            </li>


            <li class="nav-item">
                <a href="{!! url('settings/app/notifications') !!}" class="nav-link {{  Request::is('settings/app/notifications*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-bell"></i> @endif <p>{{trans('lang.app_setting_notifications')}}</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{!! url('settings/mail/smtp') !!}" class="nav-link {{ Request::is('settings/mail*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-envelope"></i> @endif <p>{{trans('lang.app_setting_mail')}}</p>
                </a>
            </li>

        </ul>
    </li>
@endcan


