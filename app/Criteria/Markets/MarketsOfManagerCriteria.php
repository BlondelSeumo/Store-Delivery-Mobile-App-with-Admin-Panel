<?php

namespace App\Criteria\Markets;

use App\Models\User;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class MarketsOfManagerCriteria.
 *
 * @package namespace App\Criteria\Markets;
 */
class MarketsOfManagerCriteria implements CriteriaInterface
{
    /**
     * @var User
     */
    private $userId;

    /**
     * MarketsOfManagerCriteria constructor.
     */
    public function __construct($userId)
    {
        $this->userId = $userId;
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
        return $model->join('user_markets','user_markets.market_id','=','markets.id')
            ->where('user_markets.user_id',$this->userId);
    }
}
