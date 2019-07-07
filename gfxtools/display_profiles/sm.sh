#!/bin/sh

single_monitor() {
	DP_ACTIVE=$(xrandr | grep ' connected' | grep 'DP-0' | awk '{print $1}' | xargs);
	HDMI_ACTIVE=$(xrandr | grep ' connected' | grep 'HDMI-0' | awk '{print $1}' | xargs);
	DEFAULT_TYPE="intern";
	DEFAULT_EXT_RES="3840x2160";
	DEFAULT_INT_RES="1920x1080";
	MONITOR=$([ -n "$1" ] && echo "$1" || echo "$DEFAULT_TYPE");
	DEFAULT_RES=$([ "$MONITOR" = "extern" ] && echo "$DEFAULT_EXT_RES" || echo "$DEFAULT_INT_RES");
	OUT_RES=$([ -n "$2" ] && echo "$2" || echo "$DEFAULT_RES");

	if [ "$MONITOR" = "extern" ] ; then
		if [ -n "$DP_ACTIVE" ] ; then
			xrandr --output 'HDMI-0' --off --output 'DP-1' --off --output 'DP-1-1' --off --output 'DP-1-2' --off --output 'eDP-1-1' --off \
				--output 'DP-0' --mode "$OUT_RES" --rotate 'normal';
		elif [ -n "$HDMI_ACTIVE" ] ; then
			xrandr --output 'DP-0' --off --output 'DP-1' --off --output 'DP-1-1' --off --output 'DP-1-2' --off --output 'eDP-1-1' --off \
				--output 'HDMI-0' --mode "$OUT_RES" --rotate 'normal';
		else
			echo 'Warning - Trying to set external display but either DisplayPort or HDMI appear to be connected';
		fi;
	else
		xrandr --output 'DP-0' --off --output 'DP-1' --off --output 'DP-1-1' --off --output 'DP-1-2' --off --output 'HDMI-0' --off \
			--output 'eDP-1-1' --mode "$OUT_RES" --rotate 'normal';
	fi;
}
