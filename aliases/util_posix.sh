#!/bin/sh
# basic posix utils

posix_str_isin() {
	# usage: posix_str_isin "b" "aba" (https://stackoverflow.com/questions/55425293/bash-compare-a-command-output-to-string)
	[ -z "${2##*$1*}" ] && { [ -z "$1" ] || [ -n "$2" ] ;}
}

posix_isint() {
	# usage: posix_isint "number" (https://github.com/dylanaraps/pure-sh-bible#check-if-a-number-is-an-integer)
	printf %d "$1" >/dev/null 2>&1;
}
