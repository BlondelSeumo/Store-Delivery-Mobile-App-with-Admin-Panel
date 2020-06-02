<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('categories')->delete();

        factory(\App\Models\Category::class,6)->create();

//        \DB::table('categories')->insert(array (
//            0 =>
//            array (
//                'id' => 1,
//                'name' => 'Grains',
//                'field' => 'Furniture',
//                'created_at' => '2019-08-29 22:54:23',
//                'updated_at' => '2019-10-18 12:38:04',
//            ),
//            1 =>
//            array (
//                'id' => 2,
//                'name' => 'Sandwiches',
//                'field' => 'Pharmacy',
//                'created_at' => '2019-08-29 23:32:04',
//                'updated_at' => '2019-08-29 23:32:04',
//            ),
//            2 =>
//            array (
//                'id' => 3,
//                'name' => 'Vegetables',
//                'field' => 'Pharmacy',
//                'created_at' => '2019-08-29 23:42:51',
//                'updated_at' => '2019-10-18 12:36:57',
//            ),
//            3 =>
//            array (
//                'id' => 4,
//                'name' => 'Fruits',
//                'field' => 'Grocery',
//                'created_at' => '2019-08-30 12:07:15',
//                'updated_at' => '2019-10-18 12:37:18',
//            ),
//            4 =>
//            array (
//                'id' => 5,
//                'name' => 'Protein',
//                'field' => 'Clothes',
//                'created_at' => '2019-08-30 12:07:38',
//                'updated_at' => '2019-10-18 12:37:32',
//            ),
//        ));
        
        
    }
}