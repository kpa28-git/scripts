#!/bin/sh

if [ "$(nordvpn status | awk '/Status:/ {print $4}')" = "Connected" ]; then
	#echo "$(nordvpn status | awk '/IP:/ {print $4}' )"
	printf '';
else
	printf '';
fi


