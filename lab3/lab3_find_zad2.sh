#!/bin/bash

kat=$1;

if [[ ! -d $kat ]]
then 
	echo "Podaj sciezke do katalogu jako parametr skryptu!";
	exit 1;
fi

find -L $kat -xtype l -perm -111 -print;
