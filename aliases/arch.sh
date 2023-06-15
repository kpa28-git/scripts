#!/bin/sh
# arch linux aliases

# ap: arch packages (pacman)
alias ap="sudo pacman -Syu" \
	apsp="sudo pacman -Syu && poweroff" \
	apsr="sudo pacman -Syu && reboot" \
	aprmlck="sudo rm '/var/lib/pacman/db.lck'" \
	apls="pacman -Qett --color=always" \
	apwhen="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort" \
	apmirru="sudo reflector --country 'United States' --latest 200 --age 24 --sort rate --save /etc/pacman.d/mirrorlist && rm -f /etc/pacman.d/mirrorlist.pacnew";

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
