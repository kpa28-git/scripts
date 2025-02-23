#!/usr/bin/env nu
# free bsd aliases

alias fp = sudo pkg install;
alias fpls = pkg info;
alias fpq = pkg info;
alias fpg = pkg info | grep;
alias fppls = pkg info -l;
alias fppmsg = pkg info -D;
alias fps = pkg search;
alias fpu = sudo pkg update and sudo pkg upgrade;
alias fprm = sudo pkg delete;
alias fpcl = sudo pkg autoremove and sudo pkg clean -a;

alias fu = sudo freebsd-update;
alias fuf = sudo freebsd-update fetch;
alias fur = sudo freebsd-update updatesready;
alias fui = sudo freebsd-update install;

alias servls = service -e;
alias servq = service -e;
alias servg = service -e | grep;
alias servs = service -l;
alias servrestart = service -R;

alias lsdefkernmod = ls /boot/kernel | grep kernel;
