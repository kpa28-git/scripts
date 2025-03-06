#!/usr/bin/env nu
# basic aliases and utilities for linux, bsd, and posix systems

# replace utils with rust alternatives
alias find = fd -HI --ignore-file "\$XDG_CONFIG_HOME/fd/ignore_file";

# file editing
def lsfilenames [] { (ls | where type == file | get name) }
def e [ file: string@lsfilenames ] { ^$env.EDITOR $file }
def supe [ file: string@lsfilenames ] { sudo -E $env.EDITOR $file }

# basic
alias l = ls -la;
alias f = ^$env.FILE;
alias c = clear;
alias diff = diff --color=auto;
alias lg = l | grep;
alias mkd = mkdir -v;
alias manp = man 1p;
alias lc = wc -l;
alias lca = wc -l *;
alias lb = lsblk -o MODE,TYPE,HOTPLUG,FSTYPE,FSVER,NAME,MOUNTPOINT,LABEL,STATE,FSUSE%,FSUSED,FSSIZE,SIZE,MODEL,PARTUUID;
alias kafter = timeout -sTERM;
alias sdn = sudo shutdown -h now;
alias mimetype = file --mime-type;
alias xo = xdg-open;
alias xdgtype = xdg-mime query filetype;
alias xdgdefault = xdg-mime query default;
alias today = ^date '+%Y-%m-%d';
# alias watch2 = watch -n 2;
alias lamp = ^ps -u;
alias laup = ^ps -u (whoami);
alias kap = ^killall;
alias kamp = ^killall -u (whoami);
def duse [] { du | sort-by physical; }
def nowpage [] { let __newp__ = ^date '+%Y_%m_%d-.md'; touch $__newp__; chmod 700 $__newp__; ^$env.EDITOR $__newp__; }

# # networking
# alias myports = sudo netstat -tulpn;
# alias lptl = sudo ^lsof -i -P -n | grep LISTEN;
alias myip = curl -q ifconfig.co;
