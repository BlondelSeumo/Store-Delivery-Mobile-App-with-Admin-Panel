<?php

namespace App\Criteria\Earnings;

use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class EarningOfMarketCriteriaCriteria.
 *
 * @package namespace App\Criteria\Earnings;
 */
class EarningOfMarketCriteria implements CriteriaInterface
{
    private $marketId;

    /**
     * EarningOfMarketCriteriaCriteria constructor.
     */
    public function __construct($marketId)
    {
        $this->marketId = $marketId;
    }

    /**
     * Apply criteria in query repository
     *
     * @param string              $model
     * @param RepositoryInterface $repository
     *
     * @return mixed
     */
    public function apply($model, RepositoryInterface $repository)
    {
        return $model->where("market_id",$this->marketId);
    }
}
