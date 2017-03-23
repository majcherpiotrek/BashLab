#!/bin/bash

lista=$1;

if [[ ! -f $lista ]]
then
	echo "Podaj plik z lista plikow do scalenia jako parametr!";
	exit 1;
fi
tmp="$lista""_tmp";
> "$tmp";

while read -r line
do
	
	echo "$line" >> "$tmp";
	if [[ -f $line ]]
	then
		while read -r fileline
		do
			echo "$fileline" >> "$tmp";
		done < "$line";
	fi


done < "$lista";

exit 0;
