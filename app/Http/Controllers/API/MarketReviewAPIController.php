<?php

namespace App\Http\Controllers\API;


use App\Http\Requests\CreateMarketReviewRequest;
use App\Models\MarketReview;
use App\Repositories\MarketReviewRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;
use Prettus\Validator\Exceptions\ValidatorException;

/**
 * Class MarketReviewController
 * @package App\Http\Controllers\API
 */

class MarketReviewAPIController extends Controller
{
    /** @var  MarketReviewRepository */
    private $marketReviewRepository;

    public function __construct(MarketReviewRepository $marketReviewRepo)
    {
        $this->marketReviewRepository = $marketReviewRepo;
    }

    /**
     * Display a listing of the MarketReview.
     * GET|HEAD /marketReviews
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->marketReviewRepository->pushCriteria(new RequestCriteria($request));
            $this->marketReviewRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $marketReviews = $this->marketReviewRepository->all();

        return $this->sendResponse($marketReviews->toArray(), 'Market Reviews retrieved successfully');
    }

    /**
     * Display the specified MarketReview.
     * GET|HEAD /marketReviews/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var MarketReview $marketReview */
        if (!empty($this->marketReviewRepository)) {
            $marketReview = $this->marketReviewRepository->findWithoutFail($id);
        }

        if (empty($marketReview)) {
            return $this->sendError('Market Review not found');
        }

        return $this->sendResponse($marketReview->toArray(), 'Market Review retrieved successfully');
    }

    /**
     * Store a newly created MarketReview in storage.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $uniqueInput = $request->only("user_id","market_id");
        $otherInput = $request->except("user_id","market_id");
        try {
            $marketReview = $this->marketReviewRepository->updateOrCreate($uniqueInput,$otherInput);
        } catch (ValidatorException $e) {
            return $this->sendError('Market Review not found');
        }

        return $this->sendResponse($marketReview->toArray(),__('lang.saved_successfully',['operator' => __('lang.market_review')]));
    }
}
