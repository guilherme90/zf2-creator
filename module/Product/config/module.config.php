<?php

/**
 * @author Guilherme P. Nogueira <guilhermenogueira90@gmail.com>
 */

use Product\Controller\FindAllProductsByPrice;
use Product\Controller\Factory\FindAllProductsByPriceFactory;
use Zend\Mvc\Router\Http\Literal;
use Zend\Mvc\Router\Http\Segment;

return [
    'controllers' => [
       'factories' => [
            FindAllProductsByPrice::class => FindAllProductsByPriceFactory::class
       ]
    ],
    'service_manager' => [
        'factories' => [

        ]
    ],
    'router' => [
        'routes' => [

        ]
    ],
    'view_manager' => [
        'template_path_stack' => [
            __DIR__ . '/../view',
        ]
    ]
];
