<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMarketFieldsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('market_fields', function (Blueprint $table) {
            $table->integer('field_id')->unsigned();
            $table->integer('market_id')->unsigned();
            $table->primary([ 'field_id','market_id']);
            $table->foreign('field_id')->references('id')->on('fields')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::drop('market_fields');
    }
}
