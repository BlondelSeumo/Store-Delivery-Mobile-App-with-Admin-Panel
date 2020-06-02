<?php

use Illuminate\Database\Seeder;

class OptionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        \DB::table('options')->delete();
        factory(\App\Models\Option::class,70)->create();

//        $options = [];
//
//        for ($i = 1; $i < 26; $i++) {
//            $options[] = array(
//                'id' => $i,
//                'name' => 'Tuna',
//                'description' => '<p>Add some tuna</p>',
//                'price' => 3.0,
//                'product_id' => 1,
//                'option_group_id' => 1,
//                'created_at' => '2019-08-30 12:39:50',
//                'updated_at' => '2019-08-30 12:39:50',
//            );
//        }
//
//
//        DB::table('options')->insert($options);


    }
}