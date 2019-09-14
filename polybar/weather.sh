#!/bin/sh

# This script gets the weather, echoes it, and places the report at "$HOME/.local/share/weatherreport".
# It is a minimalized version of Luke Smith's weather script. It does the same basic thing.
# The only non-cosmetic difference is I use my geoloc script to handle getting the location.
# Dependencies: geoloc, ping, curl, printf, tr, sed, awk

getforecast() {
	ping -q -c 1 1.1.1.1 >/dev/null || exit 1
	curl -s "wttr.in/$1" > "$HOME/.local/share/weatherreport" || exit 1 ;
}

showweather() {
	printf "%s" "$(sed '16q;d' "$HOME/.local/share/weatherreport" | grep -wo "[0-9]*%" | sort -n | sed -e '$!d' | sed -e "s/^/ﭽ /g" | tr -d '\n')"
	sed '13q;d' "$HOME/.local/share/weatherreport" | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " ﰕ",$1 "°","",$2 "°"}' ;
}

getforecast "$(geoloc "$1")";
showweather;

