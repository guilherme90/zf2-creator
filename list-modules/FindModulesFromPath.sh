#!/bin/bash

printf "\n"
read -e -p "Selecione o path raíz da sua aplicação: " realPath

modulesFromRealPath=$(ls $realPath/module)
options=($modulesFromRealPath)

printf "Módulos encontrados em $realPath\n\n"

select module in "${options[@]}" "Sair"; do
    case "$module" in
      $module)
        if [ $module == "Sair" ] ; then
          exit
          break
        fi

        export moduleName=$module
        export pathSelected=$realPath
        export pathModule=$pathSelected/module/$moduleName/src/$moduleName
        source creator/CreateControllerFile.sh
        break
        ;;
      *) echo "Módulo não encontrado.";;
    esac
done
