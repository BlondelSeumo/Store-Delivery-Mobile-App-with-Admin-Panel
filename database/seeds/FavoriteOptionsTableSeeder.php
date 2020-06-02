<?php

use Illuminate\Database\Seeder;

class FavoriteOptionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('favorite_options')->delete();
        
        \DB::table('favorite_options')->insert(array (
            0 => 
            array (
                'option_id' => 1,
                'favorite_id' => 1,
            ),
            1 => 
            array (
                'option_id' => 1,
                'favorite_id' => 5,
            ),
            2 => 
            array (
                'option_id' => 5,
                'favorite_id' => 3,
            ),
            3 => 
            array (
                'option_id' => 2,
                'favorite_id' => 6,
            ),
            4 => 
            array (
                'option_id' => 3,
                'favorite_id' => 2,
            ),
        ));
        
        
    }
}