<?php
/**
 * File name: UpdateOrderDriverTable.php
 * Last modified: 2020.04.28 at 10:14:25
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\Listeners;


use App\Criteria\Users\FilterByUserCriteria;
use App\Repositories\DriverRepository;

class UpdateOrderDriverTable
{
    /**
     * @var DriverRepository
     */
    private $driverRepository;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(DriverRepository $driverRepository)
    {

        $this->driverRepository = $driverRepository;
    }

    /**
     * Handle the event.
     *
     * @param object $event
     * @return void
     */
    public function handle($event)
    {
        // test if order delivered and paid by the client
        if ($event->order->payment->status == 'Paid' && isset($event->order->driver) && $event->order->orderStatus->id == 5) {
            $this->driverRepository->pushCriteria(new FilterByUserCriteria($event->order->driver->id));

            $driver = $this->driverRepository->first();
            if (!empty($driver)) {
                $driver->total_orders++;
                $driver->earning += $event->order->delivery_fee * $driver->delivery_fee / 100;
                $driver->save();
            }
        }
    }
}
