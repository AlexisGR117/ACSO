#!/bin/bash
echo "Elija una opcion escribiendo su respectivo numero:"
echo "1. Ver el numero de lineas del archivo /etc/prifle "
echo "2. Buscar una palabra en un archivo"
echo "3. Extraer los nombres de los usuarios junto con su descripcion"
echo "4. Listar los archivos ubicados en un directorio con unos permisos"
echo "5. Salir del menu"
read menu
while [ $menu != 5 ]
do
	case $menu in
		1)
			bash 01.sh;
		;;
		2) 
                  	echo "Segunda opcion"
                        echo "Ingrese la palabra:"
			read palabra
			echo "Ingrese la direccion del archivo"
			read archivo
			bash 02.sh $palabra $archivo
		;;
		3) 
                        echo "Tercera  opcion realiza, el archivo se guardo como usuarios.txt"
                        bash 03.sh
		;;
		4) 
                        echo "Cuarta opcion";
			echo "Ingrese el directorio"
			read directorio
			echo "Ingrese los permisos"
			read permisos
                        bash 04.sh $directorio $permisos
		;;
		5) 
			exit
		;;
	esac
	echo "Elija una opcion escribiendo su respectivo numero:"
        echo "1. Ver el numero de lineas del archivo /etc/prifle "
        echo "2. Buscar una palabra en un archivo"
        echo "3. Extraer los nombres de los usuarios junto con su descripcion"
        echo "4. Listar los archivos ubicados en un directorio con unos permisos"
        echo "5. Salir del menu"
	read menu
done

