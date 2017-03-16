#!/bin/bash
list(){
	temp=$1"/*";
	level=$2;
	for item in $temp;
	do
		if [[ -f $item ]]
		then
			filename=$(basename $item);
			echo "$filename level $level";
		else
			if [[ -d $item && $level -le 2 ]]
			then
			
			list $item $(( $level+1 ));
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

list $dir 0;

exit 0;
