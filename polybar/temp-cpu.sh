#!/bin/sh

pb_cpu_color() {
	case "$1" in
		''|*[!0-9]*) printf "INVALID NUM" && exit 1;;
		[0-4][0-9]) printf "%%{F#00E6AC}";;
		[5][0-9]) printf "%%{F#39E600}";;
		[6][0-9]) printf "%%{F#E6E600}";;
		[7][0-9]) printf "%%{F#E67300}";;
		[8][0-9]) printf "%%{F#CC4000}";;
		[9][0-9]) printf "%%{F#E62000}";;
		[1-9][0-9][0-9]) printf "%%{F#FF0000}";;
		*) printf '';;
	esac;
	exit 0;
}

CPU_TEMP=$(sensors | awk '/Package id 0/ {print $4}' | tail -c +2 | head -c -6);
printf "%s" "$(pb_cpu_color "$CPU_TEMP")$CPU_TEMP°C";
