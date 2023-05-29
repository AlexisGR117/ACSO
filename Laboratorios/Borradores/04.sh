#!/bin/bash
case $2 in
	-rw-------)
		find $1 -perm 600
		;;
	-rwx--x--x)
                find $1 -perm 711
		;; 
        -rwxr-xr-x) 
                find $1 -perm 755
		;; 
        -rwxrwxrwx) 
                find $1 -perm 777
		;; 
        -r--------) 
                find $1 -perm 400
		;; 
        -rw-r-----) 
                find $1 -perm 640
		;;
        ----------) 
                find $1 -perm 000
		;; 
        -r--r--r--) 
                find $1 -perm 444
		;; 
        -rw-r--r--) 
                find $1 -perm 644 
		;;
        -rw-rw-rw) 
                find $1 -perm 666
		;;
        -rwx------) 
                find $1 -perm 700
		;;
        -rwxr-x---) 
                find $1 -perm 750
 		;;
esac
 
 
