<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCartOptionsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cart_options', function (Blueprint $table) {
            $table->integer('option_id')->unsigned();
            $table->integer('cart_id')->unsigned();
            $table->primary([ 'option_id','cart_id']);
            $table->foreign('option_id')->references('id')->on('options')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('cart_id')->references('id')->on('carts')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('cart_options');
    }
}
