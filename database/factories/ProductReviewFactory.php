<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;

$factory->define(\App\Models\ProductReview::class, function (Faker $faker) {
    return [
        "review" => $faker->realText(),
        "rate" => $faker->randomFloat(2,1,5),
        "user_id" => $faker->numberBetween(1,6),
        "product_id" => $faker->numberBetween(1,30),
    ];
});
