<?php

use Illuminate\Database\Seeder;

class CartOptionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('cart_options')->delete();

    }
}