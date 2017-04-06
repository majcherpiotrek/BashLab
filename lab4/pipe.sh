#!/bin/bash

kat=$1;

if [[ $# -ne 2 ]]
then
	echo "Musisz podac dwa parametry skryptu - katalog oraz liczbe powtorzen pliku o tej samej nazwie.";
	exit 1;
fi

if [[ ! -d $kat ]]
then 
	echo "Podaj katalog jako pierwszy parametr";
	exit 2;
fi

num=$2;
nazwa_buf="";
wyst_buf="";
count=1;
wystapienia="";
find $kat -type f -printf "%f %p\n" | rev | sort | rev | ( while read nazwa katalog
do	
	if [[ $nazwa_buf = $nazwa ]]
	then	
		count=$(( $count+1 ));
		wystapienia=$wystapienia" "$wyst_buf" "$katalog;
	else
		if [[ $count -ge $num ]]
		then 
			echo "$nazwa_buf $count razy" $wystapienia;
		fi
		wystapienia="";
		nazwa_buf=$nazwa;
		count=1;
	fi
	wyst_buf=$katalog;
done
)
