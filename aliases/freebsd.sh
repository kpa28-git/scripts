#!/bin/sh
# free bsd aliases

alias fp="sudo pkg install" \
	fpls="pkg info" \
	fpq="pkg info" \
	fpg="pkg info | grep" \
	fppls="pkg info -l" \
	fppmsg="pkg info -D" \
	fps="pkg search" \
	fpu="sudo pkg update && sudo pkg upgrade" \
	fprm="sudo pkg delete" \
	fpcl="sudo pkg autoremove && sudo pkg clean -a";

alias fu="sudo freebsd-update" \
	fuf="sudo freebsd-update fetch" \
	fur="sudo freebsd-update updatesready" \
	fui="sudo freebsd-update install";

alias servls="service -e" \
	servq="service -e" \
	servg="service -e | grep" \
	servs="service -l" \
	servrestart="service -R";

alias lsdefkernmod="ls /boot/kernel | grep -v kernel";
