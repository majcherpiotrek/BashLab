#!/bin/bash
kat=$1;
if [ "$#" -ne "2" ]
then
	echo "Nalezy podac rozszerzenie plikow jako drugi argument!";
	exit 1
fi

if [[ ! -d "$kat" ]]
then
	echo "Pierwszy argument musi byc sciezka do folderu!";
	exit 2;
fi

wzor=$kat"/*."$2;
nowy="nowy_plik";
echo -n "" > "$nowy";
for plik in $wzor;
do
	echo $plik;
	if [ -f "$plik" ]
	then
		echo "$plik" >> "$nowy";
		cat "$plik" >> "$nowy";
		echo "" >> "$nowy";
	fi
done