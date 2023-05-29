#!/bin/sh
awk -F':' '$3 >= 1000 {print $1, $5}' /etc/passwd > usuarios.txt

