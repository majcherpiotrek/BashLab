path=$1;
filenames=$2;
while read -r line
do
	if [ -e "$path/$line" ]
	then
		echo "File $line already exists!";
	else
		touch "$path/$line";
	fi
done < "$filenames";