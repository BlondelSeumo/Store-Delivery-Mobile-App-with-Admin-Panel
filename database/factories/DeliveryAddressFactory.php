<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */


use Faker\Generator as Faker;

$factory->define(\App\Models\DeliveryAddress::class, function (Faker $faker) {
    return [
        "description" => $faker->sentence,
        "address" => $faker->address,
        "latitude" => $faker->latitude,
        "longitude" => $faker->longitude,
        "is_default" => $faker->boolean,
        "user_id" => $faker->numberBetween(1,6),
    ];
});
