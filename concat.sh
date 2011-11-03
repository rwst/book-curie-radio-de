for (( i=1; i<132; i++ ))
do
	printf -v j %03d $i
	printf -v jj %03d $((i-14))
	echo -e "<pb n='${j}'/><anchor id='Pg$j'/>\n" >>curie.tei
	cat $j.txt >>curie.tei
done
