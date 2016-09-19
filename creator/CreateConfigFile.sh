#!/bin/bash

CreateConfigFile() {
  cat <<- _PHP_
<?php

/**
 * $author
 */

use $moduleName\Controller\\$controllerName;
use $moduleName\Controller\Factory\\${controllerName}Factory;
use Zend\Mvc\Router\Http\Literal;
use Zend\Mvc\Router\Http\Segment;

return [
    'controllers' => [
       'factories' => [
            $controllerName::class => ${controllerName}Factory::class
       ]
    ],
    'service_manager' => [
        'factories' => [

        ]
    ],
    'router' => [
        'routes' => [
            'route.name' => [
                'type' => Literal::class,
                'options' => [
                    'route' => '/my-route-name',
                    'defaults' => [
                        'controller' => $controllerName::class,
                        'action' => 'onDispatch'
                    ]
                ],
                'may_terminate' => true,
                'child_routes' => [

                ]
            ]
        ]
    ],
    'view_manager' => [
        'strategies' => [
            'ViewJsonStrategy'
        ],
        'template_path_stack' => [
            __DIR__ . '/../view',
        ]
    ]
];
_PHP_
}

CreateConfigFile > $pathModule/config/module.config.php
