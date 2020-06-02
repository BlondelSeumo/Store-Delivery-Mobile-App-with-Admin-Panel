<?php
/**
 * File name: ProductController.php
 * Last modified: 2020.04.29 at 18:37:35
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\Http\Controllers;

use App\Criteria\Products\ProductsOfUserCriteria;
use App\DataTables\ProductDataTable;
use App\Http\Requests\CreateProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Repositories\CategoryRepository;
use App\Repositories\CustomFieldRepository;
use App\Repositories\MarketRepository;
use App\Repositories\ProductRepository;
use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ProductController extends Controller
{
    /** @var  ProductRepository */
    private $productRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;
    /**
     * @var MarketRepository
     */
    private $marketRepository;
    /**
     * @var CategoryRepository
     */
    private $categoryRepository;

    public function __construct(ProductRepository $productRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo
        , MarketRepository $marketRepo
        , CategoryRepository $categoryRepo)
    {
        parent::__construct();
        $this->productRepository = $productRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
        $this->marketRepository = $marketRepo;
        $this->categoryRepository = $categoryRepo;
    }

    /**
     * Display a listing of the Product.
     *
     * @param ProductDataTable $productDataTable
     * @return Response
     */
    public function index(ProductDataTable $productDataTable)
    {
        return $productDataTable->render('products.index');
    }

    /**
     * Show the form for creating a new Product.
     *
     * @return Response
     */
    public function create()
    {

        $category = $this->categoryRepository->pluck('name', 'id');
        if (auth()->user()->hasRole('admin')) {
            $market = $this->marketRepository->pluck('name', 'id');
        } else {
            $market = $this->marketRepository->myMarkets()->pluck('name', 'id');
        }
        $hasCustomField = in_array($this->productRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('products.create')->with("customFields", isset($html) ? $html : false)->with("market", $market)->with("category", $category);
    }

    /**
     * Store a newly created Product in storage.
     *
     * @param CreateProductRequest $request
     *
     * @return Response
     */
    public function store(CreateProductRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
        try {
            $product = $this->productRepository->create($input);
            $product->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($product, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.product')]));

        return redirect(route('products.index'));
    }

    /**
     * Display the specified Product.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function show($id)
    {
        $this->productRepository->pushCriteria(new ProductsOfUserCriteria(auth()->id()));
        $product = $this->productRepository->findWithoutFail($id);

        if (empty($product)) {
            Flash::error('Product not found');

            return redirect(route('products.index'));
        }

        return view('products.show')->with('product', $product);
    }

    /**
     * Show the form for editing the specified Product.
     *
     * @param int $id
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function edit($id)
    {
        $this->productRepository->pushCriteria(new ProductsOfUserCriteria(auth()->id()));
        $product = $this->productRepository->findWithoutFail($id);
        if (empty($product)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.product')]));
            return redirect(route('products.index'));
        }
        $category = $this->categoryRepository->pluck('name', 'id');
        if (auth()->user()->hasRole('admin')) {
            $market = $this->marketRepository->pluck('name', 'id');
        } else {
            $market = $this->marketRepository->myMarkets()->pluck('name', 'id');
        }
        $customFieldsValues = $product->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
        $hasCustomField = in_array($this->productRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('products.edit')->with('product', $product)->with("customFields", isset($html) ? $html : false)->with("market", $market)->with("category", $category);
    }

    /**
     * Update the specified Product in storage.
     *
     * @param int $id
     * @param UpdateProductRequest $request
     *
     * @return Response
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function update($id, UpdateProductRequest $request)
    {
        $this->productRepository->pushCriteria(new ProductsOfUserCriteria(auth()->id()));
        $product = $this->productRepository->findWithoutFail($id);

        if (empty($product)) {
            Flash::error('Product not found');
            return redirect(route('products.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
        try {
            $product = $this->productRepository->update($input, $id);

            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($product, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $product->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.product')]));

        return redirect(route('products.index'));
    }

    /**
     * Remove the specified Product from storage.
     *
     * @param int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        if (!env('APP_DEMO', false)) {
            $this->productRepository->pushCriteria(new ProductsOfUserCriteria(auth()->id()));
            $product = $this->productRepository->findWithoutFail($id);

            if (empty($product)) {
                Flash::error('Product not found');

                return redirect(route('products.index'));
            }

            $this->productRepository->delete($id);

            Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.product')]));

        } else {
            Flash::warning('This is only demo app you can\'t change this section ');
        }
        return redirect(route('products.index'));
    }

    /**
     * Remove Media of Product
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $product = $this->productRepository->findWithoutFail($input['id']);
        try {
            if ($product->hasMedia($input['collection'])) {
                $product->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
