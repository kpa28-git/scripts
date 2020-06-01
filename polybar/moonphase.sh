#!/bin/sh

# This script gets the moonphase, echoes it, and places the report at "$HOME/.local/share/moonphase".
# Dependencies: geoloc, ping, curl, printf, tr, sed, awk

MOONFILE="$HOME/.local/share/moonphase";

getmoonphase() {
	curl -s "wttr.in/$1?format=%m" > "$MOONFILE" || exit 1 ;
}

ping -q -c 1 9.9.9.9 > /dev/null || (echo '' && exit 1);
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

echo "$nficon";
