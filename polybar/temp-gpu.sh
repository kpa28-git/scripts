#!/bin/sh

pb_gpu_color() {
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

GPU_TEMP=$(nvidia-smi -q -d temperature | awk '/GPU Current Temp/ {print $5$6}' | head -c -2);
echo "$(pb_gpu_color "$GPU_TEMP")$GPU_TEMP°C";
