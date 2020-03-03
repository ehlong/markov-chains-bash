# for shuffling then producing sentences from file

SHUF=$(command -v shuf)
if [ ! -x "$SHUF" ]; then
	if [ -x "./shuffle" ]; then
		SHUF="./shuffle"
	else
		echo "No shuffle program!" 1>& 2
		exit -1
	fi
fi
if [ -r "$1" ];then
	echo ""
else
	echo "File must exist and be readable."
	exit -1
fi

if [ $2 -lt 1 ];then
	echo "Must use number larger than 0"
	exit -1
fi

LINE=$($SHUF < $1 | head -n 1) #gets random seed line
WONE=$(echo $LINE | awk '{print $1}')
WTWO=$(echo $LINE | awk '{print $2}')
WTHREE=$(echo $LINE | awk '{print $3}')
WFOUR=$(echo $LINE | awk '{print $4}')
echo -n "$WONE $WTWO $WTHREE $WFOUR "
COUNT=4
while [ $COUNT -lt $2 ]
do
	LINE=$(grep "^$WTWO $WTHREE $WFOUR" $1 | $SHUF | head -n 1)
	WONE=$(echo $LINE | awk '{print $1}')
	WTWO=$(echo $LINE | awk '{print $2}')
	WTHREE=$(echo $LINE | awk '{print $3}')
	WFOUR=$(echo $LINE | awk '{print $4}')
	echo -n "$WFOUR "
	COUNT=$(( $COUNT + 1 ))
done
echo -e "\n"
