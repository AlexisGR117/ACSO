#!/bin/bash
lastb root | awk  '$1 == "root" {print $2, $3, $4, $5}'
echo "Cantidad de intentos de acceso ilegales al usuario root:"
lastb root | awk '$1 == "root"'| wc -l
