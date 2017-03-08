path=$1"/*";
for filename in $path; do
	if [[ ! -x "$filename" ]]
	then
		rm "$filename";
		echo "Deleted \"$filename\"";
	else
		echo "File \"$filename\" is executable!";
	fi
done
