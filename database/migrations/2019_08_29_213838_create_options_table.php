<?php
/**
 * File name: 2019_08_29_213838_create_options_table.php
 * Last modified: 2020.04.28 at 22:23:04
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOptionsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('options', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 127);
            $table->text('description')->nullable();
            $table->double('price', 8, 2)->default(0);
            $table->integer('product_id')->unsigned();
            $table->integer('option_group_id')->unsigned();
            $table->timestamps();
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('option_group_id')->references('id')->on('option_groups')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('options');
    }
}
