<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;

$factory->define(\App\Models\Product::class, function (Faker $faker) {
    $products = [
        'Salad',
        'Sandwich',
        'Bread',
        'Steak',
        'Tuna steak',
        'Fish',
        'Rice',
        'Spaghetti',
        'Cookie',
        'Cupcake',
        'Pasta',
        'Eggs',
        'Cheese',
        'Milk',
        'Sugar',
        'Vinegar',
        'Honey',
        'Salt',
        'Soup',
        'Onion',
        'Acarbose',
        'Aspirin',
    ];
    $price = $faker->randomFloat(2,10,50);
    $discountPrice = $price - $faker->randomFloat(2,1,10);
    return [
        'name' => $faker->randomElement($products),
        'price' => $price,
        'discount_price' => $faker->randomElement([$discountPrice,0]),
        'description' => $faker->text,
        'capacity' => $faker->randomFloat(2,0.1,500),
        'package_items_count' => $faker->numberBetween(1,6),
        'unit' => $faker->randomElement(['L','g','Kg','Oz','ml','m','m²']),
        'featured' => $faker->boolean,
        'deliverable' =>  $faker->boolean,
        'market_id' => $faker->numberBetween(1,10),
        'category_id' => $faker->numberBetween(1,6),
    ];
});
