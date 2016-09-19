#!/bin/bash

CreateModuleFile() {
  cat <<- _PHP_
<?php

namespace $module;

use Zend\ModuleManager\Feature\ConfigProviderInterface;

/**
 * $author
 */
class Module implements ConfigProviderInterface
{
   /**
    * {@inheritDoc}
    */
    public function getConfig() : array
    {
        return require __DIR__ . '/config/module.config.php';
    }
}
_PHP_
}

CreateModuleFile > $pathModule/Module.php
