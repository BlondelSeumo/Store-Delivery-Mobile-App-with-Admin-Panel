<?php
/**
 * File name: MarketsPayout.php
 * Last modified: 2020.04.30 at 06:29:44
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\Models;

use Eloquent as Model;

/**
 * Class MarketsPayout
 * @package App\Models
 * @version March 25, 2020, 9:48 am UTC
 *
 * @property \App\Models\Market market
 * @property integer market_id
 * @property string method
 * @property double amount
 * @property dateTime paid_date
 * @property string note
 */
class MarketsPayout extends Model
{

    public $table = 'markets_payouts';
    


    public $fillable = [
        'market_id',
        'method',
        'amount',
        'paid_date',
        'note'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'market_id' => 'integer',
        'method' => 'string',
        'amount' => 'double',
        'paid_date' => 'datetime',
        'note' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'market_id' => 'required|exists:markets,id',
        'method' => 'required',
        'note' => 'required',
        'amount' => 'required|min:0.01',
    ];

    /**
     * New Attributes
     *
     * @var array
     */
    protected $appends = [
        'custom_fields',
        
    ];

    public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }

    public function getCustomFieldsAttribute()
    {
        $hasCustomField = in_array(static::class,setting('custom_field_models',[]));
        if (!$hasCustomField){
            return [];
        }
        $array = $this->customFieldsValues()
            ->join('custom_fields','custom_fields.id','=','custom_field_values.custom_field_id')
            ->where('custom_fields.in_table','=',true)
            ->get()->toArray();

        return convertToAssoc($array,'name');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function market()
    {
        return $this->belongsTo(\App\Models\Market::class, 'market_id', 'id');
    }
    
}
