#!/usr/bin/env nu
# systemd aliases

alias jlog = journalctl;
alias jlogboot = journalctl -b;
alias jlogx = journalctl -xe;

alias suls = systemctl list-units --user --type=service --state=running;
alias sulsa = systemctl list-units --user --type=service --state=active;
alias sutls = systemctl --user list-timers;
alias sudepls = systemctl --user list-dependencies;
alias suenv = systemctl --user show-environment;
alias sustat = systemctl --user status;
alias sustart = systemctl --user start;
alias sustop = systemctl --user stop;
alias suenable = systemctl --user enable;
alias sudisable = systemctl --user disable;
alias surestart = systemctl --user restart;

alias sls = systemctl list-units --type=service --state=running;
alias slsa = systemctl list-units --type=service --state=active;
alias stls = systemctl list-timers;
alias sdepls = systemctl list-dependencies;
alias sstat = systemctl status;
alias sstart = sudo systemctl start;
alias sstop = sudo systemctl stop;
alias senable = sudo systemctl enable;
alias sdisable = sudo systemctl disable;
alias srestart = sudo systemctl restart;

