<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        'App\Events\MarketChangedEvent' => [
            'App\Listeners\UpdateMarketEarningTableListener',
        ],
        'App\Events\UserRoleChangedEvent' => [
            'App\Listeners\UpdateUserDriverTableListener',
        ],
        'App\Events\OrderChangedEvent' => [
            'App\Listeners\UpdateOrderEarningTable',
            'App\Listeners\UpdateOrderDriverTable'
        ],

    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }
}
