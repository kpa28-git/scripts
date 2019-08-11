#!/bin/sh

if [ "$(nordvpn status | awk '/Status/ { print $2 }')" = "Connected" ]
then
	#echo "$(nordvpn status | awk '/IP:/ {print $4}' )"
	echo "";
else
	echo "";
fi


