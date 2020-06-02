<?php
/**
 * File name: MarketFactory.php
 * Last modified: 2020.04.20 at 18:08:03
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Market;
use Faker\Generator as Faker;

$factory->define(Market::class, function (Faker $faker) {
    return [
    'name' => $faker->randomElement(['Shop','Grocery','Market','Pharmacy','Mall','Furniture'])." ".$faker->company,
    'description' => $faker->text,
    'address' => $faker->address,
        'latitude' => $faker->randomFloat(6, 55, 37),
        'longitude' => $faker->randomFloat(6, 12, 7),
    'phone' => $faker->phoneNumber,
    'mobile' => $faker->phoneNumber,
    'information' => $faker->sentences(3,true),
    'admin_commission' => $faker->randomFloat(2,10,50),
    'delivery_fee' => $faker->randomFloat(2,1,10),
    'delivery_range' => $faker->randomFloat(2,5,100),
    'default_tax' => $faker->randomFloat(2,5,30), //added
    'closed' => $faker->boolean,
    'available_for_delivery' => $faker->boolean,
    ];
});
