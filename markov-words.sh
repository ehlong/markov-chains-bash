#!/bin/sh

WONE="^^^"
WTWO="^^"
WTHREE="^"
tr -c "a-zA-Z" '\n' | tr '[:upper:]' '[:lower:]' | \
grep '[a-zA-Z]' | sed 's/[^a-zA-Z0-9]//g' | \
grep '[aeiouyAEIOUY]' | while read WORD
do
	echo "$WONE $WTWO $WTHREE $WORD"
	WONE="$WTWO"
	WTWO="$WTHREE"
	WTHREE="$WORD"
done
