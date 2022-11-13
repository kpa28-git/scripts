#!/bin/sh
# arch linux aliases

alias yg="yay -Qs | grep" \
	yq="yay -Qi" \
	yps="yay -Ps" \
	yys="yay -Syu" \
	yysp="yay -Syu && poweroff" \
	yysr="yay -Syu && reboot" \
	pacs="sudo pacman -Syu" \
	pacsp="sudo pacman -Syu && poweroff" \
	pacsr="sudo pacman -Syu && reboot" \
	yyf="yay -Syyu" \
	yrm="yay -Rsn" \
	yls="yay -Ql" \
	ylsaur="yay -Qm" \
	ycl="yay -Yc && paccache -r" \
	yrmlck="sudo rm '/var/lib/pacman/db.lck'" \
	pacls="pacman -Qett --color=always" \
	pacwhen="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort" \
	pacmirrup="sudo reflector --country 'United States' --latest 200 --age 24 --sort rate --save /etc/pacman.d/mirrorlist && rm -f /etc/pacman.d/mirrorlist.pacnew";

alias ifck="informant check" \
	ifls="informant list" \
	ifrd="informant read" \
	ifi="ifrd \"\$(ifls | fzf | sed 's/:.*//')\"";

alias lsfont="fc-list" \
	lsfontfam="lsfont : family";

alias cleanib="rm -rf $HOME/.local/share/i4j_jres";
