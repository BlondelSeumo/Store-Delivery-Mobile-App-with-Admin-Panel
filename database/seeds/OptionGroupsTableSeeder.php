<?php

use Illuminate\Database\Seeder;

class OptionGroupsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        \DB::table('option_groups')->delete();

        \DB::table('option_groups')->insert(array(
            0 =>
                array(
                    'id' => 1,
                    'name' => 'Size',
                    'created_at' => '2019-08-31 10:55:28',
                    'updated_at' => '2019-08-31 10:55:28',
                ),
            1 =>
                array(
                    'id' => 2,
                    'name' => 'Color',
                    'created_at' => '2019-10-09 13:26:28',
                    'updated_at' => '2019-10-09 13:26:28',
                ),
            3 =>
                array(
                    'id' => 3,
                    'name' => 'Parfum',
                    'created_at' => '2019-10-09 13:26:28',
                    'updated_at' => '2019-10-09 13:26:28',
                ),
            4 =>
                array(
                    'id' => 4,
                    'name' => 'Taste',
                    'created_at' => '2019-10-09 13:26:28',
                    'updated_at' => '2019-10-09 13:26:28',
                ),
        ));


    }
}