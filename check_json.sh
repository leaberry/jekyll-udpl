
for i in events.txt; do
	echo -en "$i => "
	cat $i | python -m json.tool > /dev/null
	if [ $? -ne 0 ]; then
		echo "Invalid"
	else
		echo "Valid"
	fi
done
