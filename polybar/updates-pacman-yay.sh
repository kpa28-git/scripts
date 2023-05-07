#!/bin/sh
# Modified from: https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/updates-pacman-aurhelper

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
	updates_arch=0;
fi;

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
	updates_aur=0;
fi;

printf " %s  %s" $updates_aur $updates_arch;

