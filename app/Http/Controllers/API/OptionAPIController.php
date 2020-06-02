<?php

namespace App\Http\Controllers\API;


use App\Models\Option;
use App\Repositories\OptionRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class OptionController
 * @package App\Http\Controllers\API
 */

class OptionAPIController extends Controller
{
    /** @var  OptionRepository */
    private $optionRepository;

    public function __construct(OptionRepository $optionRepo)
    {
        $this->optionRepository = $optionRepo;
    }

    /**
     * Display a listing of the Option.
     * GET|HEAD /options
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->optionRepository->pushCriteria(new RequestCriteria($request));
            $this->optionRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $options = $this->optionRepository->all();

        return $this->sendResponse($options->toArray(), 'Options retrieved successfully');
    }

    /**
     * Display the specified Option.
     * GET|HEAD /options/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Option $option */
        if (!empty($this->optionRepository)) {
            $option = $this->optionRepository->findWithoutFail($id);
        }

        if (empty($option)) {
            return $this->sendError('Option not found');
        }

        return $this->sendResponse($option->toArray(), 'Option retrieved successfully');
    }
}
