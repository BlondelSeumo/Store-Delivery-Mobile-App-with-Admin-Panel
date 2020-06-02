<?php

namespace App\Criteria\Markets;


use Illuminate\Http\Request;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class MarketsOfFieldsCriteria.
 *
 * @package namespace App\Criteria\Markets;
 */
class MarketsOfFieldsCriteria implements CriteriaInterface
{
    /**
     * @var array
     */
    private $request;

    /**
     * MarketsOfFieldsCriteria constructor.
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
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
        if(!$this->request->has('fields')) {
            return $model;
        } else {
            $fields = $this->request->get('fields');
            if (in_array('0',$fields)) {
                return $model;
            }
            return $model->join('market_fields', 'market_fields.market_id', '=', 'markets.id')
                ->whereIn('market_fields.field_id', $this->request->get('fields'))->groupBy('markets.id');
        }
    }
}
