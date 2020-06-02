<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Notifications\NewOrder;
use App\Repositories\CartRepository;
use App\Repositories\NotificationRepository;
use App\Repositories\OrderRepository;
use App\Repositories\OrderStatusRepository;
use App\Repositories\PaymentRepository;
use App\Repositories\ProductOrderRepository;
use App\Repositories\UserRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Notification;
use Prettus\Validator\Exceptions\ValidatorException;
use Exception;

abstract class ParentOrderController extends Controller
{
    /** @var  OrderRepository */
    protected $orderRepository;
    /** @var  ProductOrderRepository */
    protected $productOrderRepository;
    /** @var  CartRepository */
    protected $cartRepository;
    /** @var  UserRepository */
    protected $userRepository;
    /** @var  PaymentRepository */
    protected $paymentRepository;
    /** @var  NotificationRepository */
    protected $notificationRepository;

    /** @var double */
    protected $total;
    /** @var double */
    protected $subtotal;

    /** @var Order */
    protected $order;
    /**
     * @var OrderStatusRepository
     */
    protected $orderStatusRepository;


    /**
     * OrderAPIController constructor.
     * @param OrderRepository $orderRepo
     * @param ProductOrderRepository $productOrderRepository
     * @param CartRepository $cartRepo
     * @param PaymentRepository $paymentRepo
     * @param NotificationRepository $notificationRepo
     * @param UserRepository $userRepository
     */
    public function __construct(OrderRepository $orderRepo, ProductOrderRepository $productOrderRepository, CartRepository $cartRepo, PaymentRepository $paymentRepo, NotificationRepository $notificationRepo, UserRepository $userRepository, OrderStatusRepository $orderStatusRepository)
    {
        parent::__construct();
        $this->orderRepository = $orderRepo;
        $this->productOrderRepository = $productOrderRepository;
        $this->cartRepository = $cartRepo;
        $this->userRepository = $userRepository;
        $this->paymentRepository = $paymentRepo;
        $this->notificationRepository = $notificationRepo;
        $this->orderStatusRepository = $orderStatusRepository;
        $this->order = new Order();

        $this->__init();
    }

    abstract public function __init();

    protected function createOrder()
    {
        if (isset($this->order->payment->status)) {
            $this->calculateTotal();
            $this->order->order_status_id = 1;
            try {
                $orders = (collect($this->order))->only('user_id', 'order_status_id', 'tax', 'delivery_address_id', 'delivery_fee', 'hint')->toArray();
                $order = $this->orderRepository->create($orders);
                $this->order->id = $order->id;
                $this->syncProducts();
                $payment = $this->createPayment();
                $this->cartRepository->deleteWhere(['user_id' => $this->order->user_id]);
                $this->orderRepository->update(['payment_id' => $payment->id], $this->order->id);
            } catch (ValidatorException $e) {
                Log::error($e->getMessage());
            }
            $this->sendNotificationToManagers();
        }
    }

    /**
     * @return float
     */
    protected function calculateTotal(): float
    {
        $carts = $this->order->user->cart;
        foreach ($carts as $_cart) {
            $price = $_cart->product->getPrice();
            foreach ($_cart->options as $option) {
                $price += $option->price;
            }
            $this->total += $price * $_cart->quantity;
        }
        $this->subtotal = $this->total;

        $this->calculateDeliveryFee();
        $this->calculateTaxFee();

        $this->total = round($this->total, 2);

        return $this->total;
    }

    /**
     * calculate the total of order with delivery fee
     */
    protected function calculateDeliveryFee(): void
    {
        try {
            $carts = $this->order->user->cart;
            $this->order->delivery_fee = $carts[0]->product->market->delivery_fee;
            $this->total += $this->order->delivery_fee;
        } catch (Exception $exception) {
            Log::error($exception->getMessage());
        }
    }

    /**
     * calculate the total of the order with the tax fee
     */
    protected function calculateTaxFee(): void
    {
        try {
            $carts = $this->order->user->cart;
            if (empty($carts[0]->product->market->default_tax)) {
                $this->order->tax = setting('default_tax', 0);
            } else {
                $this->order->tax = $carts[0]->product->market->default_tax;
            }
            $this->total += $this->total * ($this->order->tax / 100);

        } catch (Exception $exception) {
            Log::error($exception->getMessage());
        }
    }

    protected function syncProducts()
    {

        foreach ($this->order->user->cart as $cart) {
            $products = [
                'order_id' => $this->order->id,
                'product_id' => $cart->product_id,
                'price' => $cart->product->getPrice(),
                'quantity' => $cart->quantity,
                'options' => $cart->options->pluck('id')->toArray(),
            ];
            try {
                $this->productOrderRepository->create($products);
            } catch (ValidatorException $e) {
            }

        }
//        Log::info($products);
    }

    /**
     * @return mixed
     * @throws ValidatorException
     */
    protected function createPayment()
    {

        $payment = $this->paymentRepository->create([
            "user_id" => $this->order->user_id,
            "description" => trans("lang.payment_order_done"),
            "price" => $this->total,
            "status" => $this->order->payment->status,
            "method" => $this->order->payment->method,
        ]);

        return $payment;
    }

    protected function sendNotificationToManagers()
    {
        Notification::send($this->order->user->cart[0]->product->market->users, new NewOrder($this->order));
    }

}
