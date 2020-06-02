<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;

$factory->define(\App\Models\Category::class, function (Faker $faker) {
    return [
        'name'=>$faker->randomElement(['Fish','Fruit','Vegetables','Medicines','Drinks','Foods','Tools']),
        'description'=>$faker->sentences(5,true),
    ];
});
