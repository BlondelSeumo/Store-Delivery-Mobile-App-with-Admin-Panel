<?php

namespace App\Criteria\Markets;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class PopularCriteria.
 *
 * @package namespace App\Criteria\Markets;
 */
class PopularCriteria implements CriteriaInterface
{
    /**
     * @var array
     */
    private $request;

    /**
     * PopularCriteria constructor.
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    /**
     * Apply criteria in query repository
     *
     * @param string $model
     * @param RepositoryInterface $repository
     *
     * @return mixed
     */
    public function apply($model, RepositoryInterface $repository)
    {
        if ($this->request->has(['myLon', 'myLat', 'areaLon', 'areaLat'])) {

            $myLat = $this->request->get('myLat');
            $myLon = $this->request->get('myLon');
            $areaLat = $this->request->get('areaLat');
            $areaLon = $this->request->get('areaLon');

            return $model->select(DB::raw("SQRT(
                POW(69.1 * (latitude - $myLat), 2) +
                POW(69.1 * ($myLon - longitude) * COS(latitude / 57.3), 2)) AS distance, SQRT(
                POW(69.1 * (latitude - $areaLat), 2) +
                POW(69.1 * ($areaLon - longitude) * COS(latitude / 57.3), 2))  AS area count(markets.id) as market_count"), "markets.*")
                ->join('products', 'products.market_id', '=', 'markets.id')
                ->join('product_orders', 'products.id', '=', 'product_orders.product_id')
                ->orderBy('market_count','desc')
                ->orderBy('area')
                ->groupBy('markets.id');
        } else {
            return $model->select(DB::raw("count(markets.id) as market_count"), "markets.*")
                ->join('products', 'products.market_id', '=', 'markets.id')
                ->join('product_orders', 'products.id', '=', 'product_orders.product_id')
                ->orderBy('market_count','desc')
                ->groupBy('markets.id');
        }
    }
}
