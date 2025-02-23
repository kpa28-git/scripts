#!/usr/bin/env nu
# program and web api aliases

# X11 programs
alias x = sxiv -ft *;
alias xorgfocusinfo = xprop -id (xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}');

alias xlog = ^$env.PAGER /var/log/Xorg.0.log;
alias xlogold = ^$env.PAGER /var/log/Xorg.0.log;
