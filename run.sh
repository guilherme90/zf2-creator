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
      printf "\n---- Opção selecionada: Module ----\n"

      source creator/CreateModule.sh
      ;;
    "Controller")
      printf "\n---- Opção selecionada: Controller ----\n"

      export $option
      source list-modules/FindModulesFromPath.sh
      ;;
    "Sair")
      exit
      break
      ;;
    *) echo "Opção não encontrada";;
  esac
done
