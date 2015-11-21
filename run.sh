#!/bin/bash

source ColorSet.sh
source DefineAuthorFile.sh

echo -e "$LIGHT_BLUE\rBem vindo ao ZF2 Creator\n"
echo -e "$NO_COLOUR\rO que deseja criar?\n"

options=("Module" "Controller" "Sair")
select option in "${options[@]}"
do
  case $option in
    "Module")
      source creator/CreateModule.sh
        ;;
    "Controller")
      export $option
      source creator/CreateController.sh
      ;;
    "Sair")
      break
      ;;
    *) echo "Opção não encontrada";;
  esac
done
