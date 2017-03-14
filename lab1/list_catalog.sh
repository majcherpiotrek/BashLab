#!/bin/bash
list(){
	temp=$1"/*";
	for item in $temp;
	do
		if [[ -f $item ]]
		then
			filename=$(basename $item);
			echo "$filename";
		else
			if [[ -d $item ]]
			then
			list $item;
			fi
		fi
	done;
}

dir=$1;

if [[ ! -d $dir ]]
then
	echo "Jako parametr musisz podać jakiś katalog!";
	exit 1;
fi;

list $dir;

exit 0;
