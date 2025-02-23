#!/usr/bin/env nu
# arch linux aliases

# pac: arch packages (pacman)
alias pac = sudo pacman -Syu;
alias pacsp = sudo pacman -Syu and poweroff;
alias pacsr = sudo pacman -Syu and reboot;
alias pacrmlck = sudo rm '/var/lib/pacman/db.lck';
alias pacls = pacman -Qet --color=always;
alias paclsnative = pacman -Qnq;
def pacwarn [] { pacman -Qkk | grep warning; }
def pacwhen [] { expac --timefmt='%Y-%m-%dT%T' '%l\t%n' | parse "{dt}\t{name}" | sort-by dt; }
def pacwhencache [] { ls /var/cache/pacman/pkg | sort-by modified | select modified name; }

# aur: arch user repo packages (paru)
alias aurq = paru -Qi;
alias aurp = paru -Ps;
alias aurn = paru -Pw;
alias aur = paru -Syu;
alias aurrm = paru -R;
alias aurls = paru -Qm;
alias aurlsl = paru -Ql;
def aurcl [] { paru -Sc; paccache -r; }
def aurg [pkg] { paru -Qs | grep $pkg; }

alias ifck = informant check;
alias ifls = informant list;
alias ifrd = informant read;
alias ifi = ifrd (ifls | fzf | sed 's/:.*//');

alias lsfont = fc-list;
alias lsfontfam = lsfont : family;

alias cleanib = rm -rf ~/.local/share/i4j_jres;
