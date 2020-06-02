<?php

namespace App\Criteria\Products;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class TrendingWeekCriteria.
 *
 * @package namespace App\Criteria\Products;
 */
class TrendingWeekCriteria implements CriteriaInterface
{
    /**
     * @var array
     */
    private $request;

    /**
     * TrendingWeekCriteria constructor.
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

            $myLat = $this->request->get('myLat', 0);
            $myLon = $this->request->get('myLon', 0);
            $areaLat = $this->request->get('areaLat', 0);
            $areaLon = $this->request->get('areaLon', 0);

            return $model->join('markets', 'markets.id', '=', 'products.market_id')->select(DB::raw("SQRT(
            POW(69.1 * (markets.latitude - $myLat), 2) +
            POW(69.1 * ($myLon - markets.longitude) * COS(markets.latitude / 57.3), 2)) AS distance, SQRT(
            POW(69.1 * (markets.latitude - $areaLat), 2) +
            POW(69.1 * ($areaLon - markets.longitude) * COS(markets.latitude / 57.3), 2)) AS area, count(products.id) as product_count"),'products.*')
                ->join('product_orders', 'products.id', '=', 'product_orders.product_id')
                ->whereBetween('product_orders.created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
                ->orderBy('product_count','desc')
                ->orderBy('area')
                ->groupBy('products.id');
        } else {
            return $model->join('product_orders', 'products.id', '=', 'product_orders.product_id')
                ->whereBetween('product_orders.created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
                ->groupBy('products.id')
                ->orderBy('product_count','desc')
                ->select('products.*', DB::raw('count(products.id) as product_count'));
        }
    }
}
