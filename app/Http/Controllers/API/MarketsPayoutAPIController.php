<?php

namespace App\Http\Controllers\API;


use App\Models\MarketsPayout;
use App\Repositories\MarketsPayoutRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class MarketsPayoutController
 * @package App\Http\Controllers\API
 */

class MarketsPayoutAPIController extends Controller
{
    /** @var  MarketsPayoutRepository */
    private $marketsPayoutRepository;

    public function __construct(MarketsPayoutRepository $marketsPayoutRepo)
    {
        $this->marketsPayoutRepository = $marketsPayoutRepo;
    }

    /**
     * Display a listing of the MarketsPayout.
     * GET|HEAD /marketsPayouts
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->marketsPayoutRepository->pushCriteria(new RequestCriteria($request));
            $this->marketsPayoutRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $marketsPayouts = $this->marketsPayoutRepository->all();

        return $this->sendResponse($marketsPayouts->toArray(), 'Markets Payouts retrieved successfully');
    }

    /**
     * Display the specified MarketsPayout.
     * GET|HEAD /marketsPayouts/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var MarketsPayout $marketsPayout */
        if (!empty($this->marketsPayoutRepository)) {
            $marketsPayout = $this->marketsPayoutRepository->findWithoutFail($id);
        }

        if (empty($marketsPayout)) {
            return $this->sendError('Markets Payout not found');
        }

        return $this->sendResponse($marketsPayout->toArray(), 'Markets Payout retrieved successfully');
    }
}
