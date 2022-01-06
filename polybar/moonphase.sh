#!/bin/sh

# This script gets the moonphase, echoes it, and places the report at "$XDG_DATA_HOME/moonphase".
# Dependencies: geoloc, ping, curl, printf, tr, sed, awk

MOONFILE="$XDG_DATA_HOME/moonphase";

getmoonphase() {
	curl -s "wttr.in/$1?format=%m" > "$MOONFILE" || exit 1 ;
}

ping -q -c 1 9.9.9.9 > /dev/null || (printf '' && exit 1);
getmoonphase "$(geoloc "$1")";
icon="$(cat "$MOONFILE")";

case "$icon" in
	🌑) nficon="" ;;
	🌒) nficon="" ;;
	🌓) nficon="" ;;
	🌔) nficon="" ;;
	🌕) nficon="" ;;
	🌖) nficon="" ;;
	🌗) nficon="" ;;
	🌘) nficon="" ;;
	*) exit 1 ;;
esac;

printf "$nficon";
