#!/bin/bash

kat=$1;

if [[ ! -d $kat ]]
then
	echo "Podaj sciezke do katalogu jako parametr skryptu";
	exit 1;
fi

find $kat -type f -links +1 -and \( -perm -610 -o -perm -601 \) -and ! -perm -100 -print;
