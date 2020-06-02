<?php

use Illuminate\Database\Seeder;

class MarketFieldsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('market_fields')->delete();
        \DB::table('market_fields')->insert(
            [
                array(
                    'market_id' => 1,
                    'field_id' => 2,
                ),
                array(
                    'market_id' => 3,
                    'field_id' => 4,
                ),
                array(
                    'market_id' => 2,
                    'field_id' => 3,
                ),
                array(
                    'market_id' => 5,
                    'field_id' => 6,
                ),
                array(
                    'market_id' => 2,
                    'field_id' => 2,
                ),
                array(
                    'market_id' => 6,
                    'field_id' => 3,
                ),
                array(
                    'market_id' => 7,
                    'field_id' => 1,
                ),
                array(
                    'market_id' => 8,
                    'field_id' => 5,
                ),
                array(
                    'market_id' => 7,
                    'field_id' => 2,
                ),
                array(
                    'market_id' => 9,
                    'field_id' => 1,
                ),
                array(
                    'market_id' => 1,
                    'field_id' => 4,
                ),
                array(
                    'market_id' => 10,
                    'field_id' => 5,
                )
            ]
        );
    }
}
