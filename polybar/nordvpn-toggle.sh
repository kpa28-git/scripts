#!/bin/sh

COU="United_States";
CITY="";

if [ "$(nordvpn status | awk '/Status/ { print $2 }')" = "Connected" ]
then
	nordvpn d;
else
	nordvpn c "$COU" "$CITY";
fi
