<?php

namespace App\Repositories;

use App\Models\Field;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class FieldRepository
 * @package App\Repositories
 * @version April 11, 2020, 1:57 pm UTC
 *
 * @method Field findWithoutFail($id, $columns = ['*'])
 * @method Field find($id, $columns = ['*'])
 * @method Field first($columns = ['*'])
*/
class FieldRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'description'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Field::class;
    }
}
