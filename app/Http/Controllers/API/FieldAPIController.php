<?php

namespace App\Http\Controllers\API;


use App\Models\Field;
use App\Repositories\FieldRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class FieldController
 * @package App\Http\Controllers\API
 */

class FieldAPIController extends Controller
{
    /** @var  FieldRepository */
    private $fieldRepository;

    public function __construct(FieldRepository $fieldRepo)
    {
        $this->fieldRepository = $fieldRepo;
    }

    /**
     * Display a listing of the Field.
     * GET|HEAD /fields
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->fieldRepository->pushCriteria(new RequestCriteria($request));
            $this->fieldRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $fields = $this->fieldRepository->all();

        return $this->sendResponse($fields->toArray(), 'Fields retrieved successfully');
    }

    /**
     * Display the specified Field.
     * GET|HEAD /fields/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Field $field */
        if (!empty($this->fieldRepository)) {
            $field = $this->fieldRepository->findWithoutFail($id);
        }

        if (empty($field)) {
            return $this->sendError('Field not found');
        }

        return $this->sendResponse($field->toArray(), 'Field retrieved successfully');
    }
}
