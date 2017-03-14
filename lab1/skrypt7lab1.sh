#!/bin/bash
if [[ $# -lt 2 ]]
then
	echo "Musisz podać dwie ścieżki do folderów jako parametry pracy skryptu!";
	exit 1;
fi
 
path_1=$1;
path_2=$2;

if [[ ! -d $path_1 || ! -d $path_2 ]]
then
	echo "Oba parametry muszą być ścieżkami do katalogów!";
	exit 2;
else
	temp=$path_1"/*";
	for item in $temp;
	do
		if [[ -f $item && -x $item ]]
		then
			echo "Przenosze $item do $path_2 ...";
			mv $item $path_2;
		else
			echo "$item nie jest plikiem wykonywalnym. Przechodzę dalej...";
		fi;
	done;	
fi;
exit 0;
