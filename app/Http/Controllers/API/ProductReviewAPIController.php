<?php

namespace App\Http\Controllers\API;


use App\Models\ProductReview;
use App\Repositories\ProductReviewRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;
use Prettus\Validator\Exceptions\ValidatorException;

/**
 * Class ProductReviewController
 * @package App\Http\Controllers\API
 */

class ProductReviewAPIController extends Controller
{
    /** @var  ProductReviewRepository */
    private $productReviewRepository;

    public function __construct(ProductReviewRepository $productReviewRepo)
    {
        $this->productReviewRepository = $productReviewRepo;
    }

    /**
     * Display a listing of the ProductReview.
     * GET|HEAD /productReviews
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->productReviewRepository->pushCriteria(new RequestCriteria($request));
            $this->productReviewRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $productReviews = $this->productReviewRepository->all();

        return $this->sendResponse($productReviews->toArray(), 'Product Reviews retrieved successfully');
    }

    /**
     * Display the specified ProductReview.
     * GET|HEAD /productReviews/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var ProductReview $productReview */
        if (!empty($this->productReviewRepository)) {
            $productReview = $this->productReviewRepository->findWithoutFail($id);
        }

        if (empty($productReview)) {
            return $this->sendError('Product Review not found');
        }

        return $this->sendResponse($productReview->toArray(), 'Product Review retrieved successfully');
    }

    /**
     * Store a newly created ProductReview in storage.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $uniqueInput = $request->only("user_id","product_id");
        $otherInput = $request->except("user_id","product_id");
        try {
            $productReview = $this->productReviewRepository->updateOrCreate($uniqueInput,$otherInput);
        } catch (ValidatorException $e) {
            return $this->sendError('Product Review not found');
        }

        return $this->sendResponse($productReview->toArray(),__('lang.saved_successfully',['operator' => __('lang.product_review')]));
    }
}
