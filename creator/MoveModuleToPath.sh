#!/bin/bash

if [ -d $basePath ] ; then
	mv module/$module $basePath/module

	printf "\n...Concluído.\n"
	echo "O módulo está em $basePath/module/$module"
fi
