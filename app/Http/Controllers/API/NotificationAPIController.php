<?php

namespace App\Http\Controllers\API;


use App\Models\Notification;
use App\Repositories\NotificationRepository;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;
use Prettus\Validator\Exceptions\ValidatorException;

/**
 * Class NotificationController
 * @package App\Http\Controllers\API
 */

class NotificationAPIController extends Controller
{
    /** @var  NotificationRepository */
    private $notificationRepository;

    public function __construct(NotificationRepository $notificationRepo)
    {
        $this->notificationRepository = $notificationRepo;
    }

    /**
     * Display a listing of the Notification.
     * GET|HEAD /notifications
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->notificationRepository->pushCriteria(new RequestCriteria($request));
            $this->notificationRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $notifications = $this->notificationRepository->all();

        return $this->sendResponse($notifications->toArray(), 'Notifications retrieved successfully');
    }

    /**
     * Display the specified Notification.
     * GET|HEAD /notifications/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Notification $notification */
        if (!empty($this->notificationRepository)) {
            $notification = $this->notificationRepository->findWithoutFail($id);
        }

        if (empty($notification)) {
            return $this->sendError('Notification not found');
        }

        return $this->sendResponse($notification->toArray(), 'Notification retrieved successfully');
    }
    /**
     * Update the specified Notification in storage.
     *
     * @param int $id
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update($id, Request $request)
    {
        $notification = $this->notificationRepository->findWithoutFail($id);

        if (empty($notification)) {
            return $this->sendError('Notification not found');
        }
        $input = $request->all();

        if(isset($input['read_at'])){
            if($input['read_at'] == true){
                $input['read_at'] = Carbon::now();
            }else{
                unset($input['read_at']);
            }
        }
        try {
            $notification = $this->notificationRepository->update($input, $id);

        } catch (ValidatorException $e) {
            return $this->sendError($e->getMessage());
        }

        return $this->sendResponse($notification->toArray(), __('lang.saved_successfully',['operator' => __('lang.notification')]));
    }

    /**
     * Remove the specified Favorite from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $notification = $this->notificationRepository->findWithoutFail($id);

        if (empty($notification)) {
            return $this->sendError('Notification not found');
        }

        $this->notificationRepository->delete($id);

        return $this->sendResponse($notification, __('lang.deleted_successfully',['operator' => __('lang.notification')]));

    }
}
