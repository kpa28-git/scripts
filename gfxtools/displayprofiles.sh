#!/bin/sh

# Functions for various display profiles go here.

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
			echo 'Warning - Trying to set external display but neither DisplayPort or HDMI appear to be connected';
		fi;
	else
		xrandr --output 'DP-0' --off --output 'DP-1' --off --output 'DP-1-1' --off --output 'DP-1-2' --off --output 'HDMI-0' --off \
			--output 'eDP-1-1' --mode "$OUT_RES" --rotate 'normal';
	fi;
}

dual_monitor() {
	DP_ACTIVE=$(xrandr | grep ' connected' | grep 'DP-0' | awk '{print $1}' | xargs);
	HDMI_ACTIVE=$(xrandr | grep ' connected' | grep 'HDMI-0' | awk '{print $1}' | xargs);
	DEFAULT_RES_1="3840x2160";
	DEFAULT_RES_2="1920x1080";
	OUT_RES_1=$([ -n "$1" ] && echo "$1" || echo "$DEFAULT_RES_1");
	OUT_RES_2=$([ -n "$2" ] && echo "$2" || echo "$DEFAULT_RES_2");
	OUT_RATE_1=60;		# Max/default refresh rate for primary monitor
	OUT_RATE_2=144;		# Max/default refresh rate for secondary monitor, for me this is my laptop screen
	OUT_RATE=$((OUT_RATE_1 < OUT_RATE_2 ? OUT_RATE_1 : OUT_RATE_2)); # Set a common refresh rate to prevent tearing

	if [ -n "$DP_ACTIVE" ] ; then
		xrandr --output 'HDMI-0' --off --output 'DP-1' --off --output 'DP-1-1' --off --output 'DP-1-2' --off \
			--output 'DP-0' --primary --mode "$OUT_RES_1" --rate "$OUT_RATE" --rotate 'normal' \
			--output 'eDP-1-1' --mode "$OUT_RES_2" --rate "$OUT_RATE" --rotate 'normal' --right-of 'DP-0';
	elif [ -n "$HDMI_ACTIVE" ] ; then
		xrandr --output 'DP-0' --off --output 'DP-1' --off --output 'DP-1-1' --off --output 'DP-1-2' --off \
			--output 'HDMI-0' --primary --mode "$OUT_RES_2" --rate "$OUT_RATE" --rotate 'normal' \
			--output 'eDP-1-1' --mode "$OUT_RES_2" --rate "$OUT_RATE" --rotate 'normal' --right-of 'HDMI-0';
	else
		echo 'Warning - Trying to set external display but neither DisplayPort or HDMI are connected';
	fi;
}

