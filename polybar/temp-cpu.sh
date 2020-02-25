#!/bin/sh

pb_cpu_color() {
	case "$1" in
		''|*[!0-9]*) echo "INVALID NUM" && exit 1;;
		[0-4][0-9]) echo '%{F#00E6AC}';;
		[5][0-9]) echo '%{F#39E600}';;
		[6][0-9]) echo '%{F#E6E600}';;
		[7][0-9]) echo '%{F#E67300}';;
		[8][0-9]) echo '%{F#CC0000}';;
		[9][0-9]) echo '%{F#602020}';;
		[1-9][0-9][0-9]) echo '%{F#391313}';;
		*) echo '' ;;
	esac;
	exit 0;
}

CPU_TEMP=$(sensors | awk '/Package id 0/ {print $4}' | tail -c +2 | head -c -6);
echo "$(pb_cpu_color "$CPU_TEMP")$CPU_TEMP°C";
