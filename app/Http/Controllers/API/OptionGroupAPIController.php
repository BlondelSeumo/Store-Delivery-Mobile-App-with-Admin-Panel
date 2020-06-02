<?php

namespace App\Http\Controllers\API;


use App\Models\OptionGroup;
use App\Repositories\OptionGroupRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class OptionGroupController
 * @package App\Http\Controllers\API
 */

class OptionGroupAPIController extends Controller
{
    /** @var  OptionGroupRepository */
    private $optionGroupRepository;

    public function __construct(OptionGroupRepository $optionGroupRepo)
    {
        $this->optionGroupRepository = $optionGroupRepo;
    }

    /**
     * Display a listing of the OptionGroup.
     * GET|HEAD /optionGroups
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->optionGroupRepository->pushCriteria(new RequestCriteria($request));
            $this->optionGroupRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $optionGroups = $this->optionGroupRepository->all();

        return $this->sendResponse($optionGroups->toArray(), 'Option Groups retrieved successfully');
    }

    /**
     * Display the specified OptionGroup.
     * GET|HEAD /optionGroups/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var OptionGroup $optionGroup */
        if (!empty($this->optionGroupRepository)) {
            $optionGroup = $this->optionGroupRepository->findWithoutFail($id);
        }

        if (empty($optionGroup)) {
            return $this->sendError('Option Group not found');
        }

        return $this->sendResponse($optionGroup->toArray(), 'Option Group retrieved successfully');
    }
}
