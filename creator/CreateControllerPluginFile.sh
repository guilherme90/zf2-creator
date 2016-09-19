#!/bin/bash

CreateControllerPluginFile() {
  cat <<- _PHP_
<?php

namespace $moduleName\Controller\Helpers;

use Zend\Mvc\Controller\Plugin\AbstractPlugin;

/**
 * $author
 */
class $controllerName extends AbstractPlugin
{
    /**
     * @return null
     */
    public function __invoke() : null
    {
        // TODO: Implement __invoke() method.
    }
}
_PHP_
}

CreateControllerPluginFactoryFile() {
  cat <<- _PHP_
<?php

namespace $moduleName\Controller\Helpers\Factory;

use $moduleName\Controller\Helpers\\$controllerName;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * $author
 */
class ${controllerName}Factory implements FactoryInterface
{
    /**
     * {@inheritdoc}
     */
    public function createService(ServiceLocatorInterface \$serviceLocator) : $controllerName
    {
        /** @var $realServiceLocator \Zend\ServiceManager\ServiceManager */
        \$realServiceLocator = \$serviceLocator->getServiceLocator();

        return new $controllerName;
    }
}
_PHP_
}

if [ $option == "ControllerPlugin" ] ; then
  echo "Módulo: $moduleName"
  read -p "Digite o nome do plugin controller: " controllerName

  if [ ! -d $pathModule/Controller/Helpers ] ; then
    mkdir $pathModule/Controller/Helpers
  fi

  if [ ! -d $pathModule/Controller/Helpers/Factory ] ; then
    mkdir $pathModule/Controller/Helpers/Factory
  fi

  CreateControllerPluginFile > $pathModule/Controller/Helpers/$controllerName.php
  CreateControllerPluginFactoryFile > $pathModule/Controller/Helpers/Factory/${controllerName}Factory.php

  printf "\n...Concluído.\n"
  echo "$pathModule/Controller/Helpers/$controllerName.php"
  echo "$pathModule/Controller/Factory/Helpers/${controllerName}Factory.php"

  exit
fi
