<?php

namespace App\Events;

use App\Models\Market;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MarketChangedEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $market;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Market $market)
    {
        //
        $this->market = $market;
    }

}
