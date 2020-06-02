<?php

namespace App\Criteria\ProductReviews;

use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class OrderProductReviewsOfUserCriteria.
 *
 * @package namespace App\Criteria\ProductReviews;
 */
class OrderProductReviewsOfUserCriteria implements CriteriaInterface
{
    /**
     * @var int
     */
    private $userId;

    /**
     * OrderProductReviewsOfUserCriteria constructor.
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
            return $model->select('product_reviews.*');
        } else if (auth()->user()->hasRole('manager')) {
            return $model->join("products","products.id","=","product_reviews.product_id")
                ->join("user_markets", "user_markets.market_id", "=", "products.market_id")
                ->where('user_markets.user_id', $this->userId)
                ->groupBy('product_reviews.id')
                ->select('product_reviews.*');

        } else if (auth()->user()->hasRole('driver')) {
            return $model->join("products","products.id","=","product_reviews.product_id")
                ->join("driver_markets", "driver_markets.market_id", "=", "products.market_id")
                ->where('driver_markets.user_id', $this->userId)
                ->groupBy('product_reviews.id')
                ->select('product_reviews.*');

        } else if (auth()->user()->hasRole('client')) {
            return $model->newQuery()->join("products","products.id","=","product_reviews.product_id")
                ->join("product_orders", "product_orders.product_id", "=", "products.id")
                ->join("orders", "product_orders.order_id", "=", "orders.id")
                ->where('orders.user_id', $this->userId)
                ->groupBy('product_reviews.id')
                ->select('product_reviews.*');
        }else{
            return $model->select('product_reviews.*');
        }
    }
}
