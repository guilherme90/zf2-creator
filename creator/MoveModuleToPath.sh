#!/bin/bash

echo "Mover módulo \"$module\" para qual path da sua aplicação? Ex: ../my-application/"
read -e -p "Aperte TAB para navegar nos diretórios > " basePath

if [ -d $basePath ] ; then
	mv module/$module $basePath/module

	echo "...concluído. O módulo está em $basePath/module/$module"
fi
