#!/bin/sh
# program and web api aliases

# X11 programs
alias x="sxiv -ft *" \
	xorgfocusinfo="xprop -id \`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print \$NF}'\`";

alias xlog="$PAGER /var/log/Xorg.0.log" \
	xlogold="$PAGER /var/log/Xorg.0.log";
