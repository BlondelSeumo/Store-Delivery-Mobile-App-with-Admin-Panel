<?php

namespace App\Criteria\MarketReviews;

use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class MarketReviewsOfUserCriteria.
 *
 * @package namespace App\Criteria\MarketReviews;
 */
class MarketReviewsOfUserCriteria implements CriteriaInterface
{
    /**
     * @var int
     */
    private $userId;

    /**
     * MarketReviewsOfUserCriteria constructor.
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
        if (auth()->user()->hasRole('admin')) {
            return $model->select('market_reviews.*');
        } else if (auth()->user()->hasRole('manager')) {
            return $model->join("user_markets", "user_markets.market_id", "=", "market_reviews.market_id")
                ->where('user_markets.user_id', $this->userId)
                ->groupBy('market_reviews.id')
                ->select('market_reviews.*');
        } else if (auth()->user()->hasRole('driver')) {
            return $model->join("driver_markets", "driver_markets.market_id", "=", "market_reviews.market_id")
                ->where('driver_markets.user_id', $this->userId)
                ->groupBy('market_reviews.id')
                ->select('market_reviews.*');
        } else if (auth()->user()->hasRole('client')) {
            return $model->where('market_reviews.user_id', $this->userId)
                ->groupBy('market_reviews.id')
                ->select('market_reviews.*');
        }
    }
}
