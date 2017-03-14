#!/bin/bash
kat=$1;
if [[ ! -d "$kat" ]]
then
	echo "Musisz podać katalog jako prametr!";
	exit 1;
fi
lista=`ls -S $kat`;
i=1;
for plik in $lista;
do
	if [[ -f "$kat/$plik" ]]
	then
		mv "$kat/$plik" "$kat/$i.$plik";
		i=$(( $i+1 ));
	fi
done