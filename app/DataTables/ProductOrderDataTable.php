<?php

namespace App\DataTables;

use App\Models\CustomField;
use App\Models\ProductOrder;
use Barryvdh\DomPDF\Facade as PDF;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Services\DataTable;

class ProductOrderDataTable extends DataTable
{
    /**
     * custom fields columns
     * @var array
     */
    public static $customFields = [];
    public $id = 0;

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
            ->editColumn('updated_at', function ($product_order) {
                return getDateColumn($product_order, 'updated_at');
            })
            ->editColumn('options', function ($productOrder) {
                return getLinksColumnByRouteName($productOrder->options, 'options.edit', 'id', 'name');
            })
            ->editColumn('price', function ($productOrder) {
                foreach ($productOrder->options as $option) {
                    $productOrder->price += $option->price;
                }
                return getPriceColumn($productOrder);
            })
            ->rawColumns(array_merge($columns));

        return $dataTable;
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Post $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(ProductOrder $model)
    {
        return $model->newQuery()->with("product")
            ->where('product_orders.order_id', $this->id)
            ->select('product_orders.*')->orderBy('product_orders.id', 'desc');

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
            ->parameters(array_merge(
                config('datatables-buttons.parameters'), [
                    'dom' => 'rt',
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
                'data' => 'product.name',
                'title' => trans('lang.product_order_product_id'),
                'orderable' => false,
                'searchable' => false,

            ],
            [
                'data' => 'options',
                'title' => trans('lang.product_order_options'),
                'searchable' => false,
                'orderable' => false,
            ],
            [
                'data' => 'price',
                'title' => trans('lang.product_order_price'),
                'orderable' => false,

            ],
            [
                'data' => 'quantity',
                'title' => trans('lang.product_order_quantity'),
                'orderable' => false,

            ]
        ];

        $hasCustomField = in_array(ProductOrder::class, setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFieldsCollection = CustomField::where('custom_field_model', ProductOrder::class)->where('in_table', '=', true)->get();
            foreach ($customFieldsCollection as $key => $field) {
                array_splice($columns, $field->order - 1, 0, [[
                    'data' => 'custom_fields.' . $field->name . '.view',
                    'title' => trans('lang.product_order_' . $field->name),
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
        return 'product_ordersdatatable_' . time();
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