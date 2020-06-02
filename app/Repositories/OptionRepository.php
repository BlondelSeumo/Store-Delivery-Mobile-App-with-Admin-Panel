<?php

namespace App\Repositories;

use App\Models\Option;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class OptionRepository
 * @package App\Repositories
 * @version April 6, 2020, 10:56 am UTC
 *
 * @method Option findWithoutFail($id, $columns = ['*'])
 * @method Option find($id, $columns = ['*'])
 * @method Option first($columns = ['*'])
*/
class OptionRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'description',
        'price',
        'product_id',
        'option_group_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Option::class;
    }
}
