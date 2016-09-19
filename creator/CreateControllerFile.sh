#!/bin/bash

CreateControllerFile() {
  cat <<- _PHP_
<?php

namespace $moduleName\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ModelInterface;
use Zend\View\Model\ViewModel;

/**
 * $author
 */
class $controllerName extends AbstractActionController
{
    /**
     * @return ModelInterface
     */
    public function onDispatchAction() : ModelInterface
    {
        return (new ViewModel)
            ->setTemplate('');
    }
}
_PHP_
}

CreateControllerFactoryFile() {
  cat <<- _PHP_
<?php

namespace $moduleName\Controller\Factory;

use $moduleName\Controller\\$controllerName;
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
        \$realServiceLocator = \$serviceLocator->getServiceLocator();

        return new $controllerName;
    }
}
_PHP_
}

if [ $option == "Module" ] ; then
  read -p "2 - Digite o nome do Controlador: " controllerName

  if [ $controllerName != "" ] ; then
    CreateControllerFile > $pathController/$controllerName.php
    CreateControllerFactoryFile > $pathController/Factory/${controllerName}Factory.php
  fi
fi

if [ $option == "Controller" ] ; then
  echo "Módulo: $moduleName"
  read -p "Digite o nome do Controlador: " controllerName

  CreateControllerFile > $pathModule/Controller/$controllerName.php

  if [ ! -d $pathModule/Controller/Factory ] ; then
    mkdir $pathModule/Controller/Factory
  fi

  CreateControllerFactoryFile > $pathModule/Controller/Factory/${controllerName}Factory.php

  printf "\n...Concluído.\n"
  echo "$pathModule/Controller/$controllerName.php"
  echo "$pathModule/Controller/Factory/${controllerName}Factory.php"

  exit
fi

if [ $option == "ControllerPlugin" ] ; then
  source creator/CreateControllerPluginFile.sh

  exit
fi
