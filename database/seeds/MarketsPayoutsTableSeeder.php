<?php

use Illuminate\Database\Seeder;

class MarketsPayoutsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('markets_payouts')->delete();
        
    }
}