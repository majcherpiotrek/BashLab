#!/bin/bash
kat=$1;
if [[ ! -d $kat ]]
then
	echo "Parametr skryptu musi byc sciezka do katalogu!";
	exit 1;
fi;

wzor=$kat"*"

for plik in $wzor;
do

	if [[ -d $plik || -L $plik ]]
	then
		continue;
	fi
	
	for drugi_plik in $wzor;
	do
	
		if [[ $drugi_plik == $plik || -L $drugi_plik ]]
		then
			continue;
		fi
		
		echo "Sprawdzam czy dwa pliki nie sa dowiazaniem twardym...";
		echo $plik;
		echo $drugi_plik;

		inode1=`stat $plik -c "%i"`;
		inode2=`stat $drugi_plik -c "%i"`;		
		
		if [[ $inode1 == $inode2 ]]
		then		
			echo "Jest hard link!";
			nazwa=`basename $plik`;
			echo "Usuwam $nazwa";
			rm $drugi_plik;
			echo "Tworze dowiazanie ...";
			echo "Dowiazanie: $nazwa -> $plik";
			ln -s $plik $drugi_plik;
		fi
	done
done

exit 0;
