<?php

namespace App\Http\Controllers;

use App\Criteria\MarketReviews\MarketReviewsOfUserCriteria;
use App\DataTables\MarketReviewDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateMarketReviewRequest;
use App\Http\Requests\UpdateMarketReviewRequest;
use App\Repositories\MarketReviewRepository;
use App\Repositories\CustomFieldRepository;
use App\Repositories\UserRepository;
                use App\Repositories\MarketRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class MarketReviewController extends Controller
{
    /** @var  MarketReviewRepository */
    private $marketReviewRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
  * @var UserRepository
  */
private $userRepository;/**
  * @var MarketRepository
  */
private $marketRepository;

    public function __construct(MarketReviewRepository $marketReviewRepo, CustomFieldRepository $customFieldRepo , UserRepository $userRepo
                , MarketRepository $marketRepo)
    {
        parent::__construct();
        $this->marketReviewRepository = $marketReviewRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->userRepository = $userRepo;
                $this->marketRepository = $marketRepo;
    }

    /**
     * Display a listing of the MarketReview.
     *
     * @param MarketReviewDataTable $marketReviewDataTable
     * @return Response
     */
    public function index(MarketReviewDataTable $marketReviewDataTable)
    {
        return $marketReviewDataTable->render('market_reviews.index');
    }

    /**
     * Show the form for creating a new MarketReview.
     *
     * @return Response
     */
    public function create()
    {
        $user = $this->userRepository->pluck('name','id');
                $market = $this->marketRepository->pluck('name','id');
        
        $hasCustomField = in_array($this->marketReviewRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->marketReviewRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('market_reviews.create')->with("customFields", isset($html) ? $html : false)->with("user",$user)->with("market",$market);
    }

    /**
     * Store a newly created MarketReview in storage.
     *
     * @param CreateMarketReviewRequest $request
     *
     * @return Response
     */
    public function store(CreateMarketReviewRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->marketReviewRepository->model());
        try {
            $marketReview = $this->marketReviewRepository->create($input);
            $marketReview->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.market_review')]));

        return redirect(route('marketReviews.index'));
    }

    /**
     * Display the specified MarketReview.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function show($id)
    {
        $this->marketReviewRepository->pushCriteria(new MarketReviewsOfUserCriteria(auth()->id()));
        $marketReview = $this->marketReviewRepository->findWithoutFail($id);

        if (empty($marketReview)) {
            Flash::error('Market Review not found');

            return redirect(route('marketReviews.index'));
        }

        return view('market_reviews.show')->with('marketReview', $marketReview);
    }

    /**
     * Show the form for editing the specified MarketReview.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function edit($id)
    {
        $this->marketReviewRepository->pushCriteria(new MarketReviewsOfUserCriteria(auth()->id()));
        $marketReview = $this->marketReviewRepository->findWithoutFail($id);
        if (empty($marketReview)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.market_review')]));

            return redirect(route('marketReviews.index'));
        }
        $user = $this->userRepository->pluck('name','id');
                $market = $this->marketRepository->pluck('name','id');


        $customFieldsValues = $marketReview->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->marketReviewRepository->model());
        $hasCustomField = in_array($this->marketReviewRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('market_reviews.edit')->with('marketReview', $marketReview)->with("customFields", isset($html) ? $html : false)->with("user",$user)->with("market",$market);
    }

    /**
     * Update the specified MarketReview in storage.
     *
     * @param int $id
     * @param UpdateMarketReviewRequest $request
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function update($id, UpdateMarketReviewRequest $request)
    {
        $this->marketReviewRepository->pushCriteria(new MarketReviewsOfUserCriteria(auth()->id()));
        $marketReview = $this->marketReviewRepository->findWithoutFail($id);

        if (empty($marketReview)) {
            Flash::error('Market Review not found');
            return redirect(route('marketReviews.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->marketReviewRepository->model());
        try {
            $marketReview = $this->marketReviewRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $marketReview->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.market_review')]));

        return redirect(route('marketReviews.index'));
    }

    /**
     * Remove the specified MarketReview from storage.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function destroy($id)
    {
        $this->marketReviewRepository->pushCriteria(new MarketReviewsOfUserCriteria(auth()->id()));
        $marketReview = $this->marketReviewRepository->findWithoutFail($id);

        if (empty($marketReview)) {
            Flash::error('Market Review not found');

            return redirect(route('marketReviews.index'));
        }

        $this->marketReviewRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.market_review')]));

        return redirect(route('marketReviews.index'));
    }

        /**
     * Remove Media of MarketReview
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $marketReview = $this->marketReviewRepository->findWithoutFail($input['id']);
        try {
            if($marketReview->hasMedia($input['collection'])){
                $marketReview->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
