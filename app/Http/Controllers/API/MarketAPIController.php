<?php

namespace App\Http\Controllers\API;


use App\Criteria\Markets\MarketsOfFieldsCriteria;
use App\Criteria\Markets\NearCriteria;
use App\Criteria\Markets\PopularCriteria;
use App\Http\Controllers\Controller;
use App\Models\Market;
use App\Repositories\CustomFieldRepository;
use App\Repositories\MarketRepository;
use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Prettus\Repository\Exceptions\RepositoryException;
use Prettus\Validator\Exceptions\ValidatorException;

/**
 * Class MarketController
 * @package App\Http\Controllers\API
 */

class MarketAPIController extends Controller
{
    /** @var  MarketRepository */
    private $marketRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;


    public function __construct(MarketRepository $marketRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->marketRepository = $marketRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }

    /**
     * Display a listing of the Market.
     * GET|HEAD /markets
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->marketRepository->pushCriteria(new RequestCriteria($request));
            $this->marketRepository->pushCriteria(new LimitOffsetCriteria($request));
            $this->marketRepository->pushCriteria(new MarketsOfFieldsCriteria($request));
            if ($request->has('popular')) {
                $this->marketRepository->pushCriteria(new PopularCriteria($request));
            }else{
                $this->marketRepository->pushCriteria(new NearCriteria($request));
            }
            $markets = $this->marketRepository->all();

        } catch (RepositoryException $e) {
            return $this->sendError($e->getMessage());
        }

        return $this->sendResponse($markets->toArray(), 'Markets retrieved successfully');
    }

    /**
     * Display the specified Market.
     * GET|HEAD /markets/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Request $request, $id)
    {
        /** @var Market $market */
        if (!empty($this->marketRepository)) {
            try{
                $this->marketRepository->pushCriteria(new RequestCriteria($request));
                $this->marketRepository->pushCriteria(new LimitOffsetCriteria($request));
                if ($request->has(['myLon', 'myLat', 'areaLon', 'areaLat'])) {
                    $this->marketRepository->pushCriteria(new NearCriteria($request));
                }
            } catch (RepositoryException $e) {
                return $this->sendError($e->getMessage());
            }
            $market = $this->marketRepository->findWithoutFail($id);
        }

        if (empty($market)) {
            return $this->sendError('Market not found');
        }

        return $this->sendResponse($market->toArray(), 'Market retrieved successfully');
    }

    /**
     * Store a newly created Market in storage.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $input = $request->all();
        if (auth()->user()->hasRole('manager')){
            $input['users'] = [auth()->id()];
        }
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->marketRepository->model());
        try {
            $market = $this->marketRepository->create($input);
            $market->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($market, 'image');
            }
        } catch (ValidatorException $e) {
            return $this->sendError($e->getMessage());
        }

        return $this->sendResponse($market->toArray(),__('lang.saved_successfully', ['operator' => __('lang.market')]));
    }

    /**
     * Update the specified Market in storage.
     *
     * @param int $id
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update($id, Request $request)
    {
        $market = $this->marketRepository->findWithoutFail($id);

        if (empty($market)) {
            return $this->sendError('Market not found');
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->marketRepository->model());
        try {
            $market = $this->marketRepository->update($input, $id);
            $input['users'] = isset($input['users']) ? $input['users'] : [];
            $input['drivers'] = isset($input['drivers']) ? $input['drivers'] : [];
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($market, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $market->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            return $this->sendError($e->getMessage());
        }

        return $this->sendResponse($market->toArray(),__('lang.updated_successfully', ['operator' => __('lang.market')]));
    }

    /**
     * Remove the specified Market from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $market = $this->marketRepository->findWithoutFail($id);

        if (empty($market)) {
            return $this->sendError('Market not found');
        }

        $market = $this->marketRepository->delete($id);

        return $this->sendResponse($market,__('lang.deleted_successfully', ['operator' => __('lang.market')]));
    }
}
