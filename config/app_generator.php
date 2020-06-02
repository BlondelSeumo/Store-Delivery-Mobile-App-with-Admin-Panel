<?php
return [

    /*
    |--------------------------------------------------------------------------
    | Authentication Defaults
    |--------------------------------------------------------------------------
    |
    | This option controls the default authentication "guard" and password
    | reset options for your application. You may change these defaults
    | as required, but they're a perfect start for most applications.
    |
    */
    // $ php artisan infyom:app
    // $ php artisan infyom:app.rollback

    'schema' => [
        // Parents Tables
        [
            'model' => 'Field',
            'fieldsFile' => 'schema/fields.json',
            'api' => true,
        ],
        /*[
            'model' => 'Market',
            'fieldsFile' => 'schema/markets.json',
            'api' => true,
        ],*/
        [
            'model' => 'Category',
            'fieldsFile' => 'schema/categories.json',
            'api' => true,
        ],
        /*
        [
            'model' => 'FaqCategory',
            'fieldsFile' => 'schema/faq_categories.json',
            'api' => true,
        ],
        [
            'model' => 'OptionGroup',
            'fieldsFile' => 'schema/option_groups.json',
            'api' => true,
        ],
                [
            'model' => 'OrderStatus',
            'fieldsFile' => 'schema/order_statuses.json',
            'api' => true,
        ],
        [
            'model' => 'Currency',
            'fieldsFile' => 'schema/currencies.json',
            'api' => true,
        ],
         [
            'model' => 'DeliveryAddress',
            'fieldsFile' => 'schema/delivery_addresses.json',
            'api' => true,
        ],

        // Child Tables

        [
            'model' => 'Driver',
            'fieldsFile' => 'schema/drivers.json',
            'api' => true,
        ],
        [
            'model' => 'Earning',
            'fieldsFile' => 'schema/earnings.json',
            'api' => true,
        ],
        [
            'model' => 'DriversPayout',
            'fieldsFile' => 'schema/drivers_payouts.json',
            'api' => true,
        ],
        [
            'model' => 'MarketsPayout',
            'fieldsFile' => 'schema/markets_payouts.json',
            'api' => true,
        ],
        /*
        [
            'model' => 'Product',
            'fieldsFile' => 'schema/products.json',
            'api' => true,
        ],
        [
            'model' => 'Gallery',
            'fieldsFile' => 'schema/galleries.json',
            'api' => true,
        ],

        [
            'model' => 'ProductReview',
            'fieldsFile' => 'schema/product_reviews.json',
            'api' => true,
        ],
        [
            'model' => 'MarketReview',
            'fieldsFile' => 'schema/market_reviews.json',
            'api' => true,
        ],

        [
            'model' => 'Order',
            'fieldsFile' => 'schema/orders.json',
            'api' => true,
        ],
        [
            'model' => 'Cart',
            'fieldsFile' => 'schema/carts.json',
            'api' => true,
        ],
        [
            'model' => 'Option',
            'fieldsFile' => 'schema/options.json',
            'api' => true,
        ],
        [
            'model' => 'Payment',
            'fieldsFile' => 'schema/payments.json',
            'api' => true,
        ],
        [
            'model' => 'Faq',
            'fieldsFile' => 'schema/faqs.json',
            'api' => true,
        ],

        // Pivot Table

        [
            'model' => 'Favorite',
            'fieldsFile' => 'schema/favorites.json',
            'api' => true,
        ],

        [
            'model' => 'ProductOrder',
            'fieldsFile' => 'schema/product_orders.json',
            'api' => true,
        ],
        [
            'model' => 'CartOption',
            'fieldsFile' => 'schema/cart_options.json',
            'skip' => true,
        ],

        [
            'model' => 'UserMarket',
            'fieldsFile' => 'schema/user_markets.json',
            'skip' => true,
        ],

         [
            'model' => 'DriverMarket',
            'fieldsFile' => 'schema/driver_markets.json',
            'skip' => true,
        ],

        [
            'model' => 'ProductOrderOption',
            'fieldsFile' => 'schema/product_order_options.json',
            'skip' => true,
        ],
        [
            'model' => 'FavoriteOption',
            'fieldsFile' => 'schema/favorite_options.json',
            'skip' => true,
        ],*/
        [
            'model' => 'MarketField',
            'fieldsFile' => 'schema/market_fields.json',
            'skip' => true,
        ],

    ],

//    'fields' => [
//        'boolean' => 'Boolean',
//        'checkbox' => 'Checkbox',
//        'date' => 'Date',
//        'email' => 'Email',
//        'number' => 'Number',
//        'password' => 'Password',
//        'radio' => 'Radio',
//        'select' => 'Select',
//        'selects' => 'Multi Selects',
//        'text' => 'Text',
//        'textarea' => 'Textarea'
//    ],

    'fields' => [
        'boolean',
        'checkbox',
        'date',
        'email',
        'number',
        'password',
        'radio',
        'select',
        'selects',
        'text',
        'textarea'
    ],
];
