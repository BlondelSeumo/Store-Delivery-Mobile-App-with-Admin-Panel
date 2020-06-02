<?php
/**
 * File name: OrdersOfUserCriteria.php
 * Last modified: 2020.04.30 at 08:21:08
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\Criteria\Orders;

use App\Models\User;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class OrdersOfUserCriteria.
 *
 * @package namespace App\Criteria\Orders;
 */
class OrdersOfUserCriteria implements CriteriaInterface
{
    /**
     * @var User
     */
    private $userId;

    /**
     * OrdersOfUserCriteria constructor.
     */
    public function __construct($userId)
    {
        $this->userId = $userId;
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
        if (auth()->user()->hasRole('admin')) {
            return $model;
        } else if (auth()->user()->hasRole('manager')) {
            return $model->join("product_orders", "orders.id", "=", "product_orders.order_id")
                ->join("products", "products.id", "=", "product_orders.product_id")
                ->join("user_markets", "user_markets.market_id", "=", "products.market_id")
                ->where('user_markets.user_id', $this->userId)
                ->groupBy('orders.id')
                ->select('orders.*');

        } else if (auth()->user()->hasRole('client')) {
            return $model->where('orders.user_id', $this->userId)
                ->groupBy('orders.id');
        } else if (auth()->user()->hasRole('driver')) {
            return $model->newQuery()->where('orders.driver_id', $this->userId)
                ->groupBy('orders.id');
        } else {
            return $model;
        }
    }
}
