#!/bin/sh
# systemd aliases

alias jlog="journalctl" \
	jlogboot="journalctl -b" \
	jlogx="journalctl -xe";

alias xlog="$PAGER /var/log/Xorg.0.log" \
	xlogold="$PAGER /var/log/Xorg.0.log";

alias sustart="systemctl --user start" \
	sustop="systemctl --user stop" \
	suenable="systemctl --user enable" \
	sudisable="systemctl --user disable" \
	surestart="systemctl --user restart" \
	sustatus="systemctl --user status";

alias sstart="sudo systemctl start" \
	sstop="sudo systemctl stop" \
	senable="sudo systemctl enable" \
	sdisable="sudo systemctl disable" \
	srestart="sudo systemctl restart" \
	sstatus="systemctl status";

