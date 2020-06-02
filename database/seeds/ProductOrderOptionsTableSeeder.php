<?php

use Illuminate\Database\Seeder;

class ProductOrderOptionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('product_order_options')->delete();
    }
}