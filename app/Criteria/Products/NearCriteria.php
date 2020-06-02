<?php

namespace App\Criteria\Products;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class NearCriteria.
 *
 * @package namespace App\Criteria\Products;
 */
class NearCriteria implements CriteriaInterface
{
    /**
     * @var array
     */
    private $request;

    /**
     * NearCriteria constructor.
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

            return $model->join('markets', 'markets.id', '=', 'products.market_id')->select(DB::raw("SQRT(
            POW(69.1 * (markets.latitude - $myLat), 2) +
            POW(69.1 * ($myLon - markets.longitude) * COS(markets.latitude / 57.3), 2)) AS distance, SQRT(
            POW(69.1 * (markets.latitude - $areaLat), 2) +
            POW(69.1 * ($areaLon - markets.longitude) * COS(markets.latitude / 57.3), 2)) AS area"), "products.*")
                ->orderBy('closed')
                ->orderBy('area');
        } else {
            return $model->join('markets', 'markets.id', '=', 'products.market_id')->select("products.*")->orderBy('markets.closed');
        }
    }
}
