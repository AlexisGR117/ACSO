#/bin/sh
clear
resultado=$(grep -wi $1 $2)
echo $resultado
