#!/bin/sh
# Register current IP
# Refer to: http://gnudip2.sourceforge.net/gnudip-www/latest/gnudip/html/protocol.html

TMP1=/tmp/gnudip1.html
TMP2=/tmp/gnudip2.html

URLBASE="http://gnudip.dynu.com/gnudip"

wget -qO $TMP1 $URLBASE

salt=$(sed -n '/^<meta name="salt"/s/.*content="\(.*\)">/\1/p' $TMP1)
time=$(sed -n '/^<meta name="time"/s/.*content="\(.*\)">/\1/p' $TMP1)
sign=$(sed -n '/^<meta name="sign"/s/.*content="\(.*\)">/\1/p' $TMP1)
user="**********"
pass="**********"
pass=$(echo -n "$(echo -n $pass | md5sum | sed 's, .*,,').$salt" | md5sum | sed 's, .*,,')
domn="**********"
reqc="2"

URL="$URLBASE?salt=$salt&time=$time&sign=$sign&user=$user&pass=$pass&domn=$domn&reqc=$reqc"

wget -qO $TMP2 $URL

if grep -q '^<meta name="retc"' $TMP2; then
	exit $(sed -n '/<meta name="retc"/s/.*content="\(.*\)">/\1/p' $TMP2)
else
	exit 1
fi

