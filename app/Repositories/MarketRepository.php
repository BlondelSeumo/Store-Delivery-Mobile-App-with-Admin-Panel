<?php

namespace App\Repositories;

use App\Models\Market;
use InfyOm\Generator\Common\BaseRepository;
use Prettus\Repository\Contracts\CacheableInterface;
use Prettus\Repository\Traits\CacheableRepository;

/**
 * Class MarketRepository
 * @package App\Repositories
 * @version August 29, 2019, 9:38 pm UTC
 *
 * @method Market findWithoutFail($id, $columns = ['*'])
 * @method Market find($id, $columns = ['*'])
 * @method Market first($columns = ['*'])
 */
class MarketRepository extends BaseRepository implements CacheableInterface
{

    use CacheableRepository;
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'description',
        'address',
        'latitude',
        'longitude',
        'phone',
        'mobile',
        'information',
        'delivery_fee',
        'default_tax',
        'delivery_range',
        'available_for_delivery',
        'closed',
        'admin_commission',
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Market::class;
    }

    /**
     * get my markets
     */

    public function myMarkets()
    {
        return Market::join("user_markets", "market_id", "=", "markets.id")
            ->where('user_markets.user_id', auth()->id())->get();
    }

}
