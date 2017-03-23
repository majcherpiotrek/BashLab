#!/bin/bash

kat=$1;
lista=$2;
if [[ ! -d $kat || ! -f $lista ]]
then
	echo "Podaj katalog oraz plik do którego ma być utworzona lista jako parametry!";
	exit 1;
fi

wzor=$kat"/*";

for plik in $wzor;
do
	if [[ -f $plik ]]
	then
		echo "$plik" >> "$lista";
	fi
done
