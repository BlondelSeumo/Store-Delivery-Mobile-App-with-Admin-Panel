<?php

namespace App\Listeners;

use App\Criteria\Earnings\EarningOfMarketCriteria;
use App\Repositories\EarningRepository;

class UpdateOrderEarningTable
{
    /**
     * @var EarningRepository
     */
    private $earningRepository;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(EarningRepository $earningRepository)
    {
        //
        $this->earningRepository = $earningRepository;
    }

    /**
     * Handle the event.
     *
     * @param object $event
     * @return void
     */
    public function handle($event)
    {
        if ($event->order->payment->status == 'Paid') {
            $this->earningRepository->pushCriteria(new EarningOfMarketCriteria($event->order->productOrders[0]->product->market->id));

            $market = $this->earningRepository->first();
            // test if order delivered to client
            $amount = 0;
            if (empty($market)) {
                Flash::error('Markets not found');
            } else {
                foreach ($event->order->productOrders as $productOrder) {
                    $amount += $productOrder['price'] * $productOrder['quantity'];
                }
                $market->total_orders++;
                $market->market->admin_commission;
                $market->total_earning += $amount;
                $market->admin_earning += ($market->market->admin_commission / 100) * $amount;
                $market->market_earning += ($amount - $market->admin_earning);
                $market->delivery_fee += $event->order->delivery_fee;
                $market->tax += ($amount+$event->order->delivery_fee) * $event->order->tax / 100;
                $market->save();
            }
        }
    }
}
