#!/bin/bash

read -p "1 - Qual o nome do módulo? " moduleName
path="module";

CreateDirectories() {
  mkdir -p $path/$moduleName/{config/,src/$moduleName/{Controller/Factory,Repository/,Service},view/}
}

if [ -d $path/$moduleName ] ; then
  echo "O módulo $moduleName já existe e não foi possível criá-lo."
  exit
fi

if [ -d $path ] ; then
  CreateDirectories
fi

if [ ! -d $path ] ; then
  CreateDirectories
fi

export module=$moduleName
export pathModule=$path/$module
export pathController=$pathModule/src/$module/Controller
