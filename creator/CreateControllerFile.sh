#!/bin/bash

if [ $option == "Controller" ] ; then
  read -p "1 - Qual o nome do módulo? " moduleName
fi

CreateControllerFile() {
  cat <<- _PHP_
<?php

namespace $moduleName\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * $author
 */
class $controllerName extends AbstractActionController
{
    /**
     * @return ViewModel
     */
    public function onDispatchAction()
    {

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
    public function createService(ServiceLocatorInterface \$serviceLocator)
    {
        \$realServiceLocator = \$serviceLocator->getServiceLocator();

        return new $controllerName;
    }
}
_PHP_
}

if [ $option == "Module" ] ; then
  read -p "2 - Qual o nome do Controlador? " controllerName

  if [ $controllerName != "" ] ; then
    CreateControllerFile > $pathController/$controllerName.php
    CreateControllerFactoryFile > $pathController/Factory/${controllerName}Factory.php
  fi
fi

if [ $option == "Controller" ] ; then
  read -p "2 - Qual o nome do Controlador? " controllerName
  echo "3 - Qual o path do módulo para o controlador \"$controllerName\"?"
  echo "Exemplo: you-application/module/User/src/User"
  read -e -p "Aperte TAB para navegar nos diretórios) > " pathModule

  CreateControllerFile > $pathModule/Controller/$controllerName.php
  CreateControllerFactoryFile > $pathModule/Controller/Factory/${controllerName}Factory.php

  echo "...concluído. O controller foi para $pathModule/Controller/$controllerName.php"
  echo $pathModule/Controller/Factory/${controllerName}Factory.php

  break
fi
