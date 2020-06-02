<?php

use Illuminate\Database\Seeder;

class DriverMarketsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        \DB::table('driver_markets')->delete();

        \DB::table('driver_markets')->insert(array(
            0 =>
                array(
                    'user_id' => 5,
                    'market_id' => 1,
                ),
            1 =>
                array(
                    'user_id' => 5,
                    'market_id' => 2,
                ),
            2 =>
                array(
                    'user_id' => 5,
                    'market_id' => 4,
                ),
            3 =>
                array(
                    'user_id' => 6,
                    'market_id' => 2,
                ),
            4 =>
                array(
                    'user_id' => 6,
                    'market_id' => 3,
                ),
            5 =>
                array(
                    'user_id' => 6,
                    'market_id' => 4,
                ),
        ));


    }
}