<?php
/**
 * File name: OptionController.php
 * Last modified: 2020.05.26 at 16:59:07
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\Http\Controllers;

use App\Criteria\Options\OptionsOfUserCriteria;
use App\Criteria\Products\ProductsOfUserCriteria;
use App\DataTables\OptionDataTable;
use App\Http\Requests\CreateOptionRequest;
use App\Http\Requests\UpdateOptionRequest;
use App\Repositories\CustomFieldRepository;
use App\Repositories\OptionGroupRepository;
use App\Repositories\OptionRepository;
use App\Repositories\ProductRepository;
use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class OptionController extends Controller
{
    /** @var  OptionRepository */
    private $optionRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;
    /**
     * @var ProductRepository
     */
    private $productRepository;
    /**
     * @var OptionGroupRepository
     */
    private $optionGroupRepository;

    public function __construct(OptionRepository $optionRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo
        , ProductRepository $productRepo
        , OptionGroupRepository $optionGroupRepo)
    {
        parent::__construct();
        $this->optionRepository = $optionRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
        $this->productRepository = $productRepo;
        $this->optionGroupRepository = $optionGroupRepo;
    }

    /**
     * Display a listing of the Option.
     *
     * @param OptionDataTable $optionDataTable
     * @return Response
     */
    public function index(OptionDataTable $optionDataTable)
    {
        return $optionDataTable->render('options.index');
    }

    /**
     * Show the form for creating a new Option.
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function create()
    {
        $this->productRepository->pushCriteria(new ProductsOfUserCriteria(auth()->id()));
        $product = $this->productRepository->groupedByMarkets();
        $optionGroup = $this->optionGroupRepository->pluck('name', 'id');

        $hasCustomField = in_array($this->optionRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->optionRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('options.create')->with("customFields", isset($html) ? $html : false)->with("product", $product)->with("optionGroup", $optionGroup);
    }

    /**
     * Store a newly created Option in storage.
     *
     * @param CreateOptionRequest $request
     *
     * @return Response
     */
    public function store(CreateOptionRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->optionRepository->model());
        try {
            $option = $this->optionRepository->create($input);
            $option->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($option, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.option')]));

        return redirect(route('options.index'));
    }

    /**
     * Display the specified Option.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function show($id)
    {
        $this->optionRepository->pushCriteria(new OptionsOfUserCriteria(auth()->id()));

        $option = $this->optionRepository->findWithoutFail($id);

        if (empty($option)) {
            Flash::error('Option not found');

            return redirect(route('options.index'));
        }

        return view('options.show')->with('option', $option);
    }

    /**
     * Show the form for editing the specified Option.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function edit($id)
    {
        $this->optionRepository->pushCriteria(new OptionsOfUserCriteria(auth()->id()));
        $option = $this->optionRepository->findWithoutFail($id);
        if (empty($option)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.option')]));
            return redirect(route('options.index'));
        }
        $this->productRepository->pushCriteria(new ProductsOfUserCriteria(auth()->id()));
        $product = $this->productRepository->groupedByMarkets();
        $optionGroup = $this->optionGroupRepository->pluck('name', 'id');


        $customFieldsValues = $option->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->optionRepository->model());
        $hasCustomField = in_array($this->optionRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('options.edit')->with('option', $option)->with("customFields", isset($html) ? $html : false)->with("product", $product)->with("optionGroup", $optionGroup);
    }

    /**
     * Update the specified Option in storage.
     *
     * @param int $id
     * @param UpdateOptionRequest $request
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function update($id, UpdateOptionRequest $request)
    {
        $this->optionRepository->pushCriteria(new OptionsOfUserCriteria(auth()->id()));

        $option = $this->optionRepository->findWithoutFail($id);

        if (empty($option)) {
            Flash::error('Option not found');
            return redirect(route('options.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->optionRepository->model());
        try {
            $option = $this->optionRepository->update($input, $id);

            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($option, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $option->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.option')]));

        return redirect(route('options.index'));
    }

    /**
     * Remove the specified Option from storage.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function destroy($id)
    {
        $this->optionRepository->pushCriteria(new OptionsOfUserCriteria(auth()->id()));
        $option = $this->optionRepository->findWithoutFail($id);

        if (empty($option)) {
            Flash::error('Option not found');

            return redirect(route('options.index'));
        }

        $this->optionRepository->delete($id);

        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.option')]));

        return redirect(route('options.index'));
    }

    /**
     * Remove Media of Option
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $option = $this->optionRepository->findWithoutFail($input['id']);
        try {
            if ($option->hasMedia($input['collection'])) {
                $option->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
