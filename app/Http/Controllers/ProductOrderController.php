<?php

namespace App\Http\Controllers;

use App\DataTables\ProductOrderDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateProductOrderRequest;
use App\Http\Requests\UpdateProductOrderRequest;
use App\Repositories\ProductOrderRepository;
use App\Repositories\CustomFieldRepository;
use App\Repositories\ProductRepository;
                use App\Repositories\OptionRepository;
                use App\Repositories\OrderRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ProductOrderController extends Controller
{
    /** @var  ProductOrderRepository */
    private $productOrderRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
  * @var ProductRepository
  */
private $productRepository;/**
  * @var OptionRepository
  */
private $optionRepository;/**
  * @var OrderRepository
  */
private $orderRepository;

    public function __construct(ProductOrderRepository $productOrderRepo, CustomFieldRepository $customFieldRepo , ProductRepository $productRepo
                , OptionRepository $optionRepo
                , OrderRepository $orderRepo)
    {
        parent::__construct();
        $this->productOrderRepository = $productOrderRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->productRepository = $productRepo;
                $this->optionRepository = $optionRepo;
                $this->orderRepository = $orderRepo;
    }

    /**
     * Display a listing of the ProductOrder.
     *
     * @param ProductOrderDataTable $productOrderDataTable
     * @return Response
     */
    public function index(ProductOrderDataTable $productOrderDataTable)
    {
        return $productOrderDataTable->render('product_orders.index');
    }

    /**
     * Show the form for creating a new ProductOrder.
     *
     * @return Response
     */
    public function create()
    {
        $product = $this->productRepository->pluck('name','id');
                $option = $this->optionRepository->pluck('name','id');
                $order = $this->orderRepository->pluck('id','id');
        $optionsSelected = [];
        $hasCustomField = in_array($this->productOrderRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productOrderRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('product_orders.create')->with("customFields", isset($html) ? $html : false)->with("product",$product)->with("option",$option)->with("optionsSelected",$optionsSelected)->with("order",$order);
    }

    /**
     * Store a newly created ProductOrder in storage.
     *
     * @param CreateProductOrderRequest $request
     *
     * @return Response
     */
    public function store(CreateProductOrderRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productOrderRepository->model());
        try {
            $productOrder = $this->productOrderRepository->create($input);
            $productOrder->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.product_order')]));

        return redirect(route('productOrders.index'));
    }

    /**
     * Display the specified ProductOrder.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $productOrder = $this->productOrderRepository->findWithoutFail($id);

        if (empty($productOrder)) {
            Flash::error('Product Order not found');

            return redirect(route('productOrders.index'));
        }

        return view('product_orders.show')->with('productOrder', $productOrder);
    }

    /**
     * Show the form for editing the specified ProductOrder.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $productOrder = $this->productOrderRepository->findWithoutFail($id);
        $product = $this->productRepository->pluck('name','id');
                $option = $this->optionRepository->pluck('name','id');
                $order = $this->orderRepository->pluck('id','id');
        $optionsSelected = $productOrder->options()->pluck('options.id')->toArray();

        if (empty($productOrder)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.product_order')]));

            return redirect(route('productOrders.index'));
        }
        $customFieldsValues = $productOrder->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->productOrderRepository->model());
        $hasCustomField = in_array($this->productOrderRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('product_orders.edit')->with('productOrder', $productOrder)->with("customFields", isset($html) ? $html : false)->with("product",$product)->with("option",$option)->with("optionsSelected",$optionsSelected)->with("order",$order);
    }

    /**
     * Update the specified ProductOrder in storage.
     *
     * @param  int              $id
     * @param UpdateProductOrderRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateProductOrderRequest $request)
    {
        $productOrder = $this->productOrderRepository->findWithoutFail($id);

        if (empty($productOrder)) {
            Flash::error('Product Order not found');
            return redirect(route('productOrders.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productOrderRepository->model());
        try {
            $productOrder = $this->productOrderRepository->update($input, $id);
            $input['options'] = isset($input['options']) ? $input['options'] : [];
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $productOrder->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.product_order')]));

        return redirect(route('productOrders.index'));
    }

    /**
     * Remove the specified ProductOrder from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $productOrder = $this->productOrderRepository->findWithoutFail($id);

        if (empty($productOrder)) {
            Flash::error('Product Order not found');

            return redirect(route('productOrders.index'));
        }

        $this->productOrderRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.product_order')]));

        return redirect(route('productOrders.index'));
    }

        /**
     * Remove Media of ProductOrder
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $productOrder = $this->productOrderRepository->findWithoutFail($input['id']);
        try {
            if($productOrder->hasMedia($input['collection'])){
                $productOrder->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
