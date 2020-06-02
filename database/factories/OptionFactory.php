<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */


use Faker\Generator as Faker;

$factory->define(\App\Models\Option::class, function (Faker $faker) {
    return [
        'name' => $faker->randomElement(['XL','L','S','Green','Red','White','5L','2L','500g','1Kg','Tomato','Oil']),
        'description' => $faker->sentence(4),
        'price' => $faker->randomFloat(2,10,50),
        'product_id' => $faker->numberBetween(1,30),
        'option_group_id' => $faker->numberBetween(1,4),
    ];
});
