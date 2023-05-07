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

CPU_TEMP=$(sensors -u | grep -A 1 'Package id 0:' | tail -n 1 | cut -d ' ' -f 4 | cut -d '.' -f 1)
printf "%s" "$(pb_cpu_color "$CPU_TEMP")$CPU_TEMP°C";
