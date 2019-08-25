#!/bin/sh
#        _)     _)        _|
#    _` | |  __| | __ \  |    _ \
#   (   | | |    | |   | __| (   |
#  \__,_|_|_|   _|_|  _|_|  \___/
# Air Quality Index query script.
# Inspired by: https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/info-airqualityindex
# API Docs: https://aqicn.org/json-api/doc/
#
# This script sends a request to the Air Quality Open Data Platform to get the air index quality at the specified locale.
# A valid api key is required to be in a text file at $KEY_FILE (set to ~/Documents/api-keys/airqualityindex-0.txt by default).
# Uncomment the cases of the switch statement to get colored output interpretable by polybar (similar to the info-airqualityindex script).
#
# The location can be set via the commandline argument, otherwise the default will be used. Visit aqicn.org to find valid locations.
# Valid formats for the location argument are:
#	* Auto:       auto (Mozilla ip geolocation)
#	* City:       <string1>/<string2>.../...
#	* Lat Long:   geo:<lat>;<long>
#	* Center ID:  <id>
# Dependencies: sed, curl, jq

LOC=$([ -n "$1" ] && echo "$1" || echo "california/san-francisco/san-francisco-arkansas-street");
KEY_FILE="$HOME/Documents/api-keys/airqualityindex-0.txt";
BASE_URL="https://api.waqi.info/feed";

if [ "$LOC" = "auto" ]; then
	IPLOC=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue);

	if [ -n "$IPLOC" ]; then
		LOC=$(echo "$IPLOC" | jq '.location.lat,.location.lng' | tr '\n' ';' | sed 's/^/geo:/; s/;$//');
	fi;
fi;

if [ -f "$KEY_FILE" ]; then
	API_KEY=$(sed 1q "$KEY_FILE");
	RETVAL=$(curl -sf "$BASE_URL/$LOC/?token=$API_KEY");

	if [ -n "$RETVAL" ]; then
		if [ "$(echo "$RETVAL" | jq -r '.status')" = "ok" ]; then
			AQI=$(echo "$RETVAL" | jq '.data.aqi');
		fi;
	fi;

	case "$AQI" in
		''|*[!0-9]*) echo "AQI Error" && exit 1;;
	#	[0-4][0-9]) echo "%{F#009966}#%{F-} $AQI" ;;
	#	[5-9][0-9]) echo "%{F#ffde33}#%{F-} $AQI" ;;
	#	[1][0-4][0-9]) echo "%{F#ff9933}#%{F-} $AQI" ;;
	#	[1][5-9][0-9]) echo echo "%{F#cc0033}#%{F-} $AQI" ;;
	#	[2][0-9][0-9]) echo "%{F#660099}#%{F-} $AQI" ;;
	#	[3-9][0-9][0-9]) echo "%{F#7e0023}#%{F-} $AQI" ;;
		*) echo "$AQI" ;;
	esac;
else
	echo "Airqualityindex API key file must be here: $KEY_FILE";
	exit 1;
fi;
