<?php
/**
 * File name: MarketDataTable.php
 * Last modified: 2020.04.30 at 07:09:04
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 *
 */

namespace App\DataTables;

use App\Models\CustomField;
use App\Models\Market;
use Barryvdh\DomPDF\Facade as PDF;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Services\DataTable;

class MarketDataTable extends DataTable
{
    /**
     * custom fields columns
     * @var array
     */
    public static $customFields = [];

    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        $dataTable = new EloquentDataTable($query);
        $columns = array_column($this->getColumns(), 'data');
        $dataTable = $dataTable
            ->editColumn('image', function ($market) {
                return getMediaColumn($market, 'image');
            })
            ->editColumn('updated_at', function ($market) {
                return getDateColumn($market, 'updated_at');
            })
            ->editColumn('closed', function ($product) {
                return getNotBooleanColumn($product, 'closed');
            })
            ->editColumn('available_for_delivery', function ($product) {
                return getBooleanColumn($product, 'available_for_delivery');
            })
            ->addColumn('action', 'markets.datatables_actions')
            ->rawColumns(array_merge($columns, ['action']));

        return $dataTable;
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Post $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Market $model)
    {
        if (auth()->user()->hasRole('admin')) {
            return $model->newQuery();
        } else if (auth()->user()->hasRole('manager')){
            return $model->newQuery()
                ->join("user_markets", "market_id", "=", "markets.id")
                ->where('user_markets.user_id', auth()->id())
                ->groupBy("markets.id")
                ->select("markets.*");
        }else if(auth()->user()->hasRole('driver')){
            return $model->newQuery()
                ->join("driver_markets", "market_id", "=", "markets.id")
                ->where('driver_markets.user_id', auth()->id())
                ->groupBy("markets.id")
                ->select("markets.*");
        } else if (auth()->user()->hasRole('client')) {
            return $model->newQuery()
                ->join("products", "products.market_id", "=", "markets.id")
                ->join("product_orders", "products.id", "=", "product_orders.product_id")
                ->join("orders", "orders.id", "=", "product_orders.order_id")
                ->where('orders.user_id', auth()->id())
                ->groupBy("markets.id")
                ->select("markets.*");
        } else {
            return $model->newQuery();
        }
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->addAction(['width' => '80px', 'printable' => false, 'responsivePriority' => '100'])
            ->parameters(array_merge(
                config('datatables-buttons.parameters'), [
                    'language' => json_decode(
                        file_get_contents(base_path('resources/lang/' . app()->getLocale() . '/datatable.json')
                        ), true)
                ]
            ));
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        $columns = [
            [
                'data' => 'image',
                'title' => trans('lang.market_image'),
                'searchable' => false, 'orderable' => false, 'exportable' => false, 'printable' => false,
            ],
            [
                'data' => 'name',
                'title' => trans('lang.market_name'),

            ],
            [
                'data' => 'address',
                'title' => trans('lang.market_address'),

            ],
            [
                'data' => 'phone',
                'title' => trans('lang.market_phone'),

            ],
            [
                'data' => 'mobile',
                'title' => trans('lang.market_mobile'),

            ],
            [
                'data' => 'available_for_delivery',
                'title' => trans('lang.market_available_for_delivery'),

            ],
            [
                'data' => 'closed',
                'title' => trans('lang.market_closed'),

            ],
            [
                'data' => 'updated_at',
                'title' => trans('lang.market_updated_at'),
                'searchable' => false,
            ]
        ];

        $hasCustomField = in_array(Market::class, setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFieldsCollection = CustomField::where('custom_field_model', Market::class)->where('in_table', '=', true)->get();
            foreach ($customFieldsCollection as $key => $field) {
                array_splice($columns, $field->order - 1, 0, [[
                    'data' => 'custom_fields.' . $field->name . '.view',
                    'title' => trans('lang.market_' . $field->name),
                    'orderable' => false,
                    'searchable' => false,
                ]]);
            }
        }
        return $columns;
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'marketsdatatable_' . time();
    }

    /**
     * Export PDF using DOMPDF
     * @return mixed
     */
    public function pdf()
    {
        $data = $this->getDataForPrint();
        $pdf = PDF::loadView($this->printPreview, compact('data'));
        return $pdf->download($this->filename() . '.pdf');
    }
}