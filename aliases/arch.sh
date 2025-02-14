#!/bin/sh
# arch linux aliases

# pac: arch packages (pacman)
alias pac="sudo pacman -Syu" \
	pacsp="sudo pacman -Syu && poweroff" \
	pacsr="sudo pacman -Syu && reboot" \
	pacrmlck="sudo rm '/var/lib/pacman/db.lck'" \
	pacls="pacman -Qet --color=always" \
	paclsnative="pacman -Qnq" \
	pacwarn="pacman -Qkk | grep warning" \
	pacwhen="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort" \
	pacwhencache="/bin/ls -lrt /var/cache/pacman/pkg" \ 
	pacmirru="sudo reflector --country US --latest 200 --age 24 --sort rate --save /etc/pacman.d/mirrorlist && rm -f /etc/pacman.d/mirrorlist.pacnew";

# aur: arch user repo packages (paru)
alias aurg="paru -Qs | grep -B1" \
	aurq="paru -Qi" \
	aurp="paru -Ps" \
	aurn="paru -Pw" \
	aur="paru -Syu" \
	aurrm="paru -R" \
	aurls="paru -Qm" \
	aurlsl="paru -Ql" \
	aurcl="paru -Sc && paccache -r";

alias ifck="informant check" \
	ifls="informant list" \
	ifrd="informant read" \
	ifi="ifrd \"\$(ifls | fzf | sed 's/:.*//')\"";

alias lsfont="fc-list" \
	lsfontfam="lsfont : family";

alias cleanib="rm -rf $HOME/.local/share/i4j_jres";
