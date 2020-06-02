<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProductOrderOptionsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_order_options', function (Blueprint $table) {
            $table->integer('product_order_id')->unsigned();
            $table->integer('option_id')->unsigned();
            $table->double('price', 8, 2)->default(0);
            $table->primary([ 'product_order_id','option_id']);
            $table->foreign('product_order_id')->references('id')->on('product_orders')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('option_id')->references('id')->on('options')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('product_order_options');
    }
}
