#!/bin/bash

recursion(){
	lvl=$1;
	limit=$2;
	if [[ $lvl -lt $limit ]]
	then
		echo "Recursion level $lvl";
		lvl=$(($lvl + 1));
		recursion "$lvl" "$limit";
	fi
}
recursion $1 $2;
