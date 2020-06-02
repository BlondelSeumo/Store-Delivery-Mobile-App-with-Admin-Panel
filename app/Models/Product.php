<?php
/**
 * File name: Product.php
 * Last modified: 2020.05.26 at 17:09:50
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\Models;

use Eloquent as Model;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;

/**
 * Class Product
 * @package App\Models
 * @version August 29, 2019, 9:38 pm UTC
 *
 * @property \App\Models\Market market
 * @property \App\Models\Category category
 * @property \Illuminate\Database\Eloquent\Collection Option
 * @property \Illuminate\Database\Eloquent\Collection Nutrition
 * @property \Illuminate\Database\Eloquent\Collection ProductsReview
 * @property string id
 * @property string name
 * @property double price
 * @property double discount_price
 * @property string description
 * @property double capacity
 * @property boolean featured
 * @property double package_items_count
 * @property string unit
 * @property integer market_id
 * @property integer category_id
 */
class Product extends Model implements HasMedia
{
    use HasMediaTrait {
        getFirstMediaUrl as protected getFirstMediaUrlTrait;
    }

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required',
        'price' => 'required|numeric|min:0',
        'description' => 'required',
        'market_id' => 'required|exists:markets,id',
        'category_id' => 'required|exists:categories,id'
    ];

    public $table = 'products';
    public $fillable = [
        'name',
        'price',
        'discount_price',
        'description',
        'capacity',
        'package_items_count',
        'unit',
        'featured',
        'deliverable',
        'market_id',
        'category_id'
    ];
    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string',
        'image' => 'string',
        'price' => 'double',
        'discount_price' => 'double',
        'description' => 'string',
        'capacity' => 'double',
        'package_items_count' => 'integer',
        'unit' => 'string',
        'featured' => 'boolean',
        'deliverable' => 'boolean',
        'market_id' => 'integer',
        'category_id' => 'double'
    ];
    /**
     * New Attributes
     *
     * @var array
     */
    protected $appends = [
        'custom_fields',
        'has_media',
        'market'
    ];

    /**
     * @param Media|null $media
     * @throws \Spatie\Image\Exceptions\InvalidManipulation
     */
    public function registerMediaConversions(Media $media = null)
    {
        $this->addMediaConversion('thumb')
            ->fit(Manipulations::FIT_CROP, 200, 200)
            ->sharpen(10);

        $this->addMediaConversion('icon')
            ->fit(Manipulations::FIT_CROP, 100, 100)
            ->sharpen(10);
    }

    /**
     * to generate media url in case of fallback will
     * return the file type icon
     * @param string $conversion
     * @return string url
     */
    public function getFirstMediaUrl($collectionName = 'default', $conversion = '')
    {
        $url = $this->getFirstMediaUrlTrait($collectionName);
        $array = explode('.', $url);
        $extension = strtolower(end($array));
        if (in_array($extension, config('medialibrary.extensions_has_thumb'))) {
            return asset($this->getFirstMediaUrlTrait($collectionName, $conversion));
        } else {
            return asset(config('medialibrary.icons_folder') . '/' . $extension . '.png');
        }
    }

    public function getCustomFieldsAttribute()
    {
        $hasCustomField = in_array(static::class, setting('custom_field_models', []));
        if (!$hasCustomField) {
            return [];
        }
        $array = $this->customFieldsValues()
            ->join('custom_fields', 'custom_fields.id', '=', 'custom_field_values.custom_field_id')
            ->where('custom_fields.in_table', '=', true)
            ->get()->toArray();

        return convertToAssoc($array, 'name');
    }

    public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }

    /**
     * Add Media to api results
     * @return bool
     */
    public function getHasMediaAttribute()
    {
        return $this->hasMedia('image') ? true : false;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function category()
    {
        return $this->belongsTo(\App\Models\Category::class, 'category_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function options()
    {
        return $this->hasMany(\App\Models\Option::class, 'product_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     **/
    public function optionGroups()
    {
        return $this->belongsToMany(\App\Models\OptionGroup::class,'options');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function productReviews()
    {
        return $this->hasMany(\App\Models\ProductReview::class, 'product_id');
    }

    /**
     * get market attribute
     * @return \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Eloquent\Relations\BelongsTo|object|null
     */
    public function getMarketAttribute()
    {
        return $this->market()->first(['id', 'name', 'delivery_fee', 'address', 'phone','default_tax']);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function market()
    {
        return $this->belongsTo(\App\Models\Market::class, 'market_id', 'id');
    }

    /**
     * @return float
     */
    public function getPrice(): float
    {
        return $this->discount_price > 0 ? $this->discount_price : $this->price;
    }


}
