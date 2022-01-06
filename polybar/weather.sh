#!/bin/sh

# This script gets the weather, echoes it, and places the report at "$XDG_DATA_HOME/weatherreport".
# It is a minimalized version of Luke Smith's weather script. It does the same basic thing.
# The only non-cosmetic difference is I use my geoloc script to handle getting the location.
# Dependencies: geoloc, ping, curl, printf, tr, sed, awk

getforecast() {
	curl -s "wttr.in/$1" > "$XDG_DATA_HOME/weatherreport" || exit 1 ;
}

showweather() {
	printf "%s" "$(sed '16q;d' "$XDG_DATA_HOME/weatherreport" | grep -wo "[0-9]*%" | sort -n | sed -e '$!d' | sed -e "s/^/ﭽ /g" | tr -d '\n')"
	sed '13q;d' "$XDG_DATA_HOME/weatherreport" | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " ﰕ",$1 "°","",$2 "°"}' ;
}

ping -q -c 1 9.9.9.9 > /dev/null || (printf '' && exit 1);
getforecast "$(geoloc "$1")";
showweather;

