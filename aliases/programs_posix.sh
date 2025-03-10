#!/bin/sh
# basic aliases and utilities for linux, bsd, and posix systems

# replace utils with rust alternatives
alias l="ls -lah --color=auto --group-directories-first" \
	find="fd -HI --ignore-file \"\$HOME\"/.config/fd/ignore_file";

# basic
alias f="\$FILE" \
	e="\$EDITOR" \
	supe="sudo -E \$EDITOR" \
	c="clear" \
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
	today="date '+%Y-%m-%d'" \
	myports="sudo netstat -tulpn" \
	watch2="watch -n 2 " \
	nowpage="__newp__=\$(date +\"%Y_%m_%d-.md\"); touch \$__newp__; chmod 700 \$__newp__; \$VISUAL \$__newp__" \
	lamp="ps -u \`whoami\`" \
	kamp="kap -u \`whoami\`";

# networking
alias lptl="sudo lsof -i -P -n | grep LISTEN" \
	myip="curl -q ifconfig.co";
