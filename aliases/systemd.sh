#!/bin/sh
# systemd aliases

alias jlog="journalctl" \
	jlogboot="journalctl -b" \
	jlogx="journalctl -xe";

alias suls="systemctl list-units --user --type=service --state=running" \
	sulsa="systemctl list-units --user --type=service --state=active" \
	sutls="systemctl --user list-timers" \
	sudepls="systemctl --user list-dependencies" \
	suenv="systemctl --user show-environment" \
	sustat="systemctl --user status" \
	sustart="systemctl --user start" \
	sustop="systemctl --user stop" \
	suenable="systemctl --user enable" \
	sudisable="systemctl --user disable" \
	surestart="systemctl --user restart";

alias sls="systemctl list-units --type=service --state=running" \
	slsa="systemctl list-units --type=service --state=active" \
	stls="systemctl list-timers" \
	sdepls="systemctl list-dependencies" \
	sstat="systemctl status" \
	sstart="sudo systemctl start" \
	sstop="sudo systemctl stop" \
	senable="sudo systemctl enable" \
	sdisable="sudo systemctl disable" \
	srestart="sudo systemctl restart";

