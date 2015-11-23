<?php

namespace Product;

use Zend\ModuleManager\Feature\ConfigProviderInterface;

/**
 * @author Guilherme P. Nogueira <guilhermenogueira90@gmail.com>
 */
class Module implements ConfigProviderInterface
{
   /**
    * {@inheritDoc}
    */
    public function getConfig()
    {
        return array_merge_recursive(
           require __DIR__ . '/config/module.config.php'
        );
    }
}
