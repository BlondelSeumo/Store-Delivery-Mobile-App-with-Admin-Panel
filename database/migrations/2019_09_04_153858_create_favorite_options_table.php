<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateFavoriteOptionsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('favorite_options', function (Blueprint $table) {
            $table->integer('option_id')->unsigned();
            $table->integer('favorite_id')->unsigned();
            $table->primary([ 'option_id','favorite_id']);
            $table->foreign('option_id')->references('id')->on('options')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('favorite_id')->references('id')->on('favorites')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('favorite_options');
    }
}
