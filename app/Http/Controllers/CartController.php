<?php

namespace App\Http\Controllers;

use App\DataTables\CartDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateCartRequest;
use App\Http\Requests\UpdateCartRequest;
use App\Repositories\CartRepository;
use App\Repositories\CustomFieldRepository;
use App\Repositories\ProductRepository;
use App\Repositories\UserRepository;
use App\Repositories\OptionRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class CartController extends Controller
{
    /** @var  CartRepository */
    private $cartRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var ProductRepository
     */
    private $productRepository;
    /**
     * @var UserRepository
     */
    private $userRepository;
    /**
     * @var OptionRepository
     */
    private $optionRepository;

    public function __construct(CartRepository $cartRepo, CustomFieldRepository $customFieldRepo, ProductRepository $productRepo
        , UserRepository $userRepo
        , OptionRepository $optionRepo)
    {
        parent::__construct();
        $this->cartRepository = $cartRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->productRepository = $productRepo;
        $this->userRepository = $userRepo;
        $this->optionRepository = $optionRepo;
    }

    /**
     * Display a listing of the Cart.
     *
     * @param CartDataTable $cartDataTable
     * @return Response
     */
    public function index(CartDataTable $cartDataTable)
    {
        return $cartDataTable->render('carts.index');
    }

    /**
     * Show the form for creating a new Cart.
     *
     * @return Response
     */
    public function create()
    {
        $product = $this->productRepository->pluck('name', 'id');
        $user = $this->userRepository->pluck('name', 'id');
        $option = $this->optionRepository->pluck('name', 'id');
        $optionsSelected = [];
        $hasCustomField = in_array($this->cartRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->cartRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('carts.create')->with("customFields", isset($html) ? $html : false)->with("product", $product)->with("user", $user)->with("option", $option)->with("optionsSelected", $optionsSelected);
    }

    /**
     * Store a newly created Cart in storage.
     *
     * @param CreateCartRequest $request
     *
     * @return Response
     */
    public function store(CreateCartRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->cartRepository->model());
        try {
            $cart = $this->cartRepository->create($input);
            $cart->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));

        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.cart')]));

        return redirect(route('carts.index'));
    }

    /**
     * Display the specified Cart.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $cart = $this->cartRepository->findWithoutFail($id);

        if (empty($cart)) {
            Flash::error('Cart not found');

            return redirect(route('carts.index'));
        }

        return view('carts.show')->with('cart', $cart);
    }

    /**
     * Show the form for editing the specified Cart.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $cart = $this->cartRepository->findWithoutFail($id);
        $product = $this->productRepository->pluck('name', 'id');
        $user = $this->userRepository->pluck('name', 'id');
        $option = $this->optionRepository->pluck('name', 'id');
        $optionsSelected = $cart->options()->pluck('options.id')->toArray();

        if (empty($cart)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.cart')]));

            return redirect(route('carts.index'));
        }
        $customFieldsValues = $cart->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->cartRepository->model());
        $hasCustomField = in_array($this->cartRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('carts.edit')->with('cart', $cart)->with("customFields", isset($html) ? $html : false)->with("product", $product)->with("user", $user)->with("option", $option)->with("optionsSelected", $optionsSelected);
    }

    /**
     * Update the specified Cart in storage.
     *
     * @param int $id
     * @param UpdateCartRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCartRequest $request)
    {
        $cart = $this->cartRepository->findWithoutFail($id);

        if (empty($cart)) {
            Flash::error('Cart not found');
            return redirect(route('carts.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->cartRepository->model());
        try {
            $cart = $this->cartRepository->update($input, $id);
            $input['options'] = isset($input['options']) ? $input['options'] : [];

            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $cart->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.cart')]));

        return redirect(route('carts.index'));
    }

    /**
     * Remove the specified Cart from storage.
     *
     * @param int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $cart = $this->cartRepository->findWithoutFail($id);

        if (empty($cart)) {
            Flash::error('Cart not found');

            return redirect(route('carts.index'));
        }

        $this->cartRepository->delete($id);

        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.cart')]));

        return redirect(route('carts.index'));
    }

    /**
     * Remove Media of Cart
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $cart = $this->cartRepository->findWithoutFail($input['id']);
        try {
            if ($cart->hasMedia($input['collection'])) {
                $cart->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
