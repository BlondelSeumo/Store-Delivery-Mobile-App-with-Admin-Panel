<?php
/**
 * File name: 2019_08_29_213940_create_market_reviews_table.php
 * Last modified: 2020.04.28 at 18:15:06
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMarketReviewsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('market_reviews', function (Blueprint $table) {
            $table->increments('id');
            $table->text('review')->nullable();
            $table->unsignedTinyInteger('rate')->default(0);
            $table->integer('user_id')->unsigned();
            $table->integer('market_id')->unsigned();
            $table->timestamps();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('market_id')->references('id')->on('markets')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('market_reviews');
    }
}
