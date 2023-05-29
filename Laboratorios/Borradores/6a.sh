#!/bin/bash
echo "Ingrese el nombre"
read nombre
echo "Ingrese el directorio de búsqueda"
read directorio
if [ -d "$directorio/$nombre" ]
then
	echo "Es un subdirectorio"
elif [ -f "$directorio/$nombre" ]
then
	echo "Es un archivo"
else
	echo "No es un subdirectorio ni un archivo"
fi
