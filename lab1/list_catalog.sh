#!/bin/bash
list(){
	directory=$1;
	template=$1"/*";
	lvl=$2;
	prefix=$3;
	if [[ $lvl -le 2 ]]
	then
		for item in $template;
		do
			if [[ -d $item ]]
			then
				lvl=$(($lvl + 1));
				echo "Wchodze do rekursji $lvl!";
				base=`basename "$item"`;
				$nextprefix="$prefix$base";
				list $item $lvl "$nextprefix";
				lvl=$(($lvl - 1));		
			else
				name=`basename "$item"`;
				echo "$prefix$name" "rec $lvl";
			fi
		done
	fi
}

dir=$1;

if [[ ! -d $dir ]]
then
	echo "Jako parametr musisz podać jakiś katalog!";
	exit 1;
fi;

list $dir 0 "";
