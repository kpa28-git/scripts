#!/bin/sh

COU="United_States";
CITY="San_Francisco";

if [ "$(nordvpn status | awk '/Status/ { print $2 }')" = "Connected" ]
then
	nordvpn d;
else
	nordvpn c "$COU" "$CITY";
fi
