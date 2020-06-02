<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class MarketReview
 * @package App\Models
 * @version August 29, 2019, 9:39 pm UTC
 *
 * @property \App\Models\User user
 * @property \App\Models\Market market
 * @property string review
 * @property unsignedTinyInteger rate
 * @property integer user_id
 * @property integer market_id
 */
class MarketReview extends Model
{

    public $table = 'market_reviews';
    


    public $fillable = [
        'review',
        'rate',
        'user_id',
        'market_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'review' => 'string',
        'user_id' => 'integer',
        'market_id' => 'integer',
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'user_id' => 'required|exists:users,id',
        'market_id' => 'required|exists:markets,id',
        'review' => 'required',
        'rate' => 'required',
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
    public function user()
    {
        return $this->belongsTo(\App\Models\User::class, 'user_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function market()
    {
        return $this->belongsTo(\App\Models\Market::class, 'market_id', 'id');
    }
    
}
