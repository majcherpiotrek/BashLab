#!/bin/bash

kat=$1;

if [[ ! -d $kat ]]
then 
	exit 1;
fi

i=0;

while [[ $i -lt 10 ]] 
do
	echo "sialala" >> "$kat/plik$i";
	i=$(( $i + 1 ));
done
