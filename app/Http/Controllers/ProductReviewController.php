<?php

namespace App\Http\Controllers;

use App\Criteria\ProductReviews\ProductReviewsOfUserCriteria;
use App\DataTables\ProductReviewDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateProductReviewRequest;
use App\Http\Requests\UpdateProductReviewRequest;
use App\Repositories\ProductReviewRepository;
use App\Repositories\CustomFieldRepository;
use App\Repositories\UserRepository;
                use App\Repositories\ProductRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ProductReviewController extends Controller
{
    /** @var  ProductReviewRepository */
    private $productReviewRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
  * @var UserRepository
  */
private $userRepository;/**
  * @var ProductRepository
  */
private $productRepository;

    public function __construct(ProductReviewRepository $productReviewRepo, CustomFieldRepository $customFieldRepo , UserRepository $userRepo
                , ProductRepository $productRepo)
    {
        parent::__construct();
        $this->productReviewRepository = $productReviewRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->userRepository = $userRepo;
                $this->productRepository = $productRepo;
    }

    /**
     * Display a listing of the ProductReview.
     *
     * @param ProductReviewDataTable $productReviewDataTable
     * @return Response
     */
    public function index(ProductReviewDataTable $productReviewDataTable)
    {
        return $productReviewDataTable->render('product_reviews.index');
    }

    /**
     * Show the form for creating a new ProductReview.
     *
     * @return Response
     */
    public function create()
    {
        $user = $this->userRepository->pluck('name','id');
                $product = $this->productRepository->pluck('name','id');
        
        $hasCustomField = in_array($this->productReviewRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productReviewRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('product_reviews.create')->with("customFields", isset($html) ? $html : false)->with("user",$user)->with("product",$product);
    }

    /**
     * Store a newly created ProductReview in storage.
     *
     * @param CreateProductReviewRequest $request
     *
     * @return Response
     */
    public function store(CreateProductReviewRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productReviewRepository->model());
        try {
            $productReview = $this->productReviewRepository->create($input);
            $productReview->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.product_review')]));

        return redirect(route('productReviews.index'));
    }

    /**
     * Display the specified ProductReview.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function show($id)
    {
        $this->productReviewRepository->pushCriteria(new ProductReviewsOfUserCriteria(auth()->id()));
        $productReview = $this->productReviewRepository->findWithoutFail($id);

        if (empty($productReview)) {
            Flash::error('Product Review not found');

            return redirect(route('productReviews.index'));
        }

        return view('product_reviews.show')->with('productReview', $productReview);
    }

    /**
     * Show the form for editing the specified ProductReview.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function edit($id)
    {
        $this->productReviewRepository->pushCriteria(new ProductReviewsOfUserCriteria(auth()->id()));
        $productReview = $this->productReviewRepository->findWithoutFail($id);
        if (empty($productReview)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.product_review')]));
            return redirect(route('productReviews.index'));
        }
        $user = $this->userRepository->pluck('name','id');
                $product = $this->productRepository->pluck('name','id');


        $customFieldsValues = $productReview->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->productReviewRepository->model());
        $hasCustomField = in_array($this->productReviewRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('product_reviews.edit')->with('productReview', $productReview)->with("customFields", isset($html) ? $html : false)->with("user",$user)->with("product",$product);
    }

    /**
     * Update the specified ProductReview in storage.
     *
     * @param int $id
     * @param UpdateProductReviewRequest $request
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function update($id, UpdateProductReviewRequest $request)
    {
        $this->productReviewRepository->pushCriteria(new ProductReviewsOfUserCriteria(auth()->id()));
        $productReview = $this->productReviewRepository->findWithoutFail($id);

        if (empty($productReview)) {
            Flash::error('Product Review not found');
            return redirect(route('productReviews.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productReviewRepository->model());
        try {
            $productReview = $this->productReviewRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $productReview->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.product_review')]));

        return redirect(route('productReviews.index'));
    }

    /**
     * Remove the specified ProductReview from storage.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function destroy($id)
    {
        $this->productReviewRepository->pushCriteria(new ProductReviewsOfUserCriteria(auth()->id()));
        $productReview = $this->productReviewRepository->findWithoutFail($id);

        if (empty($productReview)) {
            Flash::error('Product Review not found');

            return redirect(route('productReviews.index'));
        }

        $this->productReviewRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.product_review')]));

        return redirect(route('productReviews.index'));
    }

        /**
     * Remove Media of ProductReview
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $productReview = $this->productReviewRepository->findWithoutFail($input['id']);
        try {
            if($productReview->hasMedia($input['collection'])){
                $productReview->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
