#!/bin/sh

WONE="^^^"
WTWO="^^"
WTHREE="^"
tr -c "a-zA-Z" '\n' | tr '[:upper:]' '[:lower:]' | \
grep '[a-zA-Z]' | grep '[aeiouyAEIOUY]' | \
grep -vwE "(e|u|y)" | while read WORD
do
	echo "$WONE $WTWO $WTHREE $WORD"
	WONE="$WTWO"
	WTWO="$WTHREE"
	WTHREE="$WORD"
done
