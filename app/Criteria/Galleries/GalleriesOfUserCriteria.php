<?php
/**
 * File name: GalleriesOfUserCriteria.php
 * Last modified: 2020.04.30 at 08:21:08
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\Criteria\Galleries;

use App\Models\User;
use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class GalleriesOfUserCriteria.
 *
 * @package namespace App\Criteria\Galleries;
 */
class GalleriesOfUserCriteria implements CriteriaInterface
{
    /**
     * @var User
     */
    private $userId;

    /**
     * GalleriesOfUserCriteria constructor.
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
        } elseif (auth()->user()->hasRole('manager')) {
            return $model->join('user_markets', 'user_markets.market_id', '=', 'galleries.market_id')
                ->groupBy('galleries.id')
                ->select('galleries.*')
                ->where('user_markets.user_id', $this->userId);
        } else {
            return $model;
        }
    }
}
