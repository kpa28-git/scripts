#!/bin/sh
# load shell aliases based on OS and/or distro

[ -f "$ALIASDIR/util_posix.sh" ] && . "$ALIASDIR/util_posix.sh" # must be run first
[ -f "$ALIASDIR/programs_posix.sh" ] && . "$ALIASDIR/programs_posix.sh"

if posix_str_isin "systemd" "$(ps --no-headers -o comm 1)"; then
	[ -f "$ALIASDIR/systemd.sh" ] && . "$ALIASDIR/systemd.sh"
fi;

if posix_str_isin "arch" "$(uname -r)"; then
	[ -f "$ALIASDIR/arch.sh" ] && . "$ALIASDIR/arch.sh"
elif posix_str_isin "FreeBSD" "$(uname -v)"; then
	[ -f "$ALIASDIR/freebsd.sh" ] && . "$ALIASDIR/freebsd.sh"
elif posix_str_isin "postmarketos" "$(uname -v)"; then
	[ -f "$ALIASDIR/alpine.sh" ] && . "$ALIASDIR/alpine.sh"
fi;

if posix_str_isin "wayland" "$XDG_SESSION_TYPE"; then
	[ -f "$ALIASDIR/programs_wayland.sh" ] && . "$ALIASDIR/programs_wayland.sh"
elif posix_str_isin "x11" "$XDG_SESSION_TYPE"; then
	[ -f "$ALIASDIR/programs_x11.sh" ] && . "$ALIASDIR/programs_x11.sh"
fi;

[ -f "$ALIASDIR/programs.sh" ] && . "$ALIASDIR/programs.sh"
[ -f "$ALIASDIR/custom.sh" ] && . "$ALIASDIR/custom.sh"

