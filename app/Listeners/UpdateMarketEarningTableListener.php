<?php

namespace App\Listeners;

use App\Repositories\EarningRepository;
use Illuminate\Support\Facades\Log;
use Prettus\Validator\Exceptions\ValidatorException;

class UpdateMarketEarningTableListener
{
    /**
     * @var EarningRepository
     */
    private $earningRepository;

    /**
     * EarningTableListener constructor.
     */
    public function __construct(EarningRepository $earningRepository)
    {

        $this->earningRepository = $earningRepository;
    }


    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $uniqueInput = ['market_id'=>$event->market->id];
        try {
            $this->earningRepository->updateOrCreate($uniqueInput);
        } catch (ValidatorException $e) {
        }
    }
}
