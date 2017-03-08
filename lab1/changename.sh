filepath=$1"/*";
for filename in $filepath; do
	if [ -f "$filename" ] 
	then
		name_length=${#filename};
		extension=${filename:name_length-4};
		if [ $extension = ".old" ]
		then
			rm "$filename";
		else
			mv "$filename" $filename".old";
		fi
	else
		echo "folder!";
	fi
done