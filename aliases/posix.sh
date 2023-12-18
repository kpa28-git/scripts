#!/bin/sh
# basic aliases and utilities for linux, bsd, and posix systems

# replace utils with rust alternatives
alias l="eza -lah --git --icons=always --color=auto --group-directories-first" \
	ls="eza -h --icons=always --color=auto --group-directories-first" \
	grep="rg" \
	cat="bat" \
	find="fd -HI --ignore-file \"\$HOME\"/.config/fd/ignore_file";

# basic
alias f="\$FILE" \
	e="\$EDITOR" \
	supe="sudo -E \$EDITOR" \
	v="\$VISUAL" \
	supv="sudo -E \$VISUAL" \
	c="clear" \
	i="htop -t" \
	diff="diff --color=auto" \
	lg="l | grep" \
	mkd="mkdir -pv" \
	manp="man 1p" \
	lc="wc -l" \
	lca="wc -l *" \
	duse="du -chH | sort -h" \
	lb="lsblk -o MODE,TYPE,HOTPLUG,FSTYPE,FSVER,NAME,MOUNTPOINT,LABEL,STATE,FSUSE%,FSUSED,FSSIZE,SIZE,MODEL,PARTUUID" \
	kafter="timeout -sTERM" \
	sdn="sudo shutdown -h now" \
	lap="ps -u" \
	kap="killall" \
	mimetype="file --mime-type" \
	xo="xdg-open" \
	xdgtype="xdg-mime query filetype" \
	xdgdefault="xdg-mime query default" \
	xorgfocusinfo="xprop -id \`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print \$NF}'\`" \
	today="date '+%Y-%m-%d'" \
	myports="sudo netstat -tulpn" \
	watch2="watch -n 2 " \
	nowpage="$VISUAL \$(date +\"%Y_%m_%d-.md\")" \
	lamp="ps -u \`whoami\`" \
	kamp="kap -u \`whoami\`";

# networking
alias lptl="sudo lsof -i -P -n | grep LISTEN" \
	myip="curl -q ifconfig.co";

# basic posix utils

posix_str_isin() {
	# usage: posix_str_isin "b" "aba" (https://stackoverflow.com/questions/55425293/bash-compare-a-command-output-to-string)
	[ -z "${2##*$1*}" ] && { [ -z "$1" ] || [ -n "$2" ] ;}
}

posix_isint() {
	# usage: posix_isint "number" (https://github.com/dylanaraps/pure-sh-bible#check-if-a-number-is-an-integer)
	printf %d "$1" >/dev/null 2>&1;
}
