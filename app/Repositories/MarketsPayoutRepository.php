<?php

namespace App\Repositories;

use App\Models\MarketsPayout;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class MarketsPayoutRepository
 * @package App\Repositories
 * @version March 25, 2020, 9:48 am UTC
 *
 * @method MarketsPayout findWithoutFail($id, $columns = ['*'])
 * @method MarketsPayout find($id, $columns = ['*'])
 * @method MarketsPayout first($columns = ['*'])
*/
class MarketsPayoutRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'market_id',
        'method',
        'amount',
        'paid_date',
        'note'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return MarketsPayout::class;
    }
}
