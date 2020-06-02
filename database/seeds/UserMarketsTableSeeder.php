<?php

use Illuminate\Database\Seeder;

class UserMarketsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     * @throws Exception
     */
    public function run()
    {


        \DB::table('user_markets')->delete();

        \DB::table('user_markets')->insert(array(
            0 =>
                array(
                    'user_id' => 1,
                    'market_id' => 2,
                ),
            1 =>
                array(
                    'user_id' => 1,
                    'market_id' => 5,
                ),
            2 =>
                array(
                    'user_id' => 2,
                    'market_id' => 3,
                ),
            3 =>
                array(
                    'user_id' => 2,
                    'market_id' => 4,
                ),
            5 =>
                array(
                    'user_id' => 1,
                    'market_id' => 6,
                ),
            6 =>
                array(
                    'user_id' => 1,
                    'market_id' => 3,
                ),
        ));


    }
}