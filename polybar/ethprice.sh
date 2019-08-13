#!/bin/env sh
#          __  __               _
#    ___  / /_/ /_  ____  _____(_)_______
#   / _ \/ __/ __ \/ __ \/ ___/ / ___/ _ \
#  /  __/ /_/ / / / /_/ / /  / / /__/  __/
#  \___/\__/_/ /_/ .___/_/  /_/\___/\___/
#               /_/
# Ethereum price query script.
# Just a wrapper around coinquote.sh for polybar.
# The first commandline argument is the number of sigfigs to output, uses 2 by default.
# Outputs Format: $<price> <1 hr pct>% <24hr pct>% <7d pct>%

SIGFIG=$([ -n "$1" ] && echo "$1" || echo 2);
SCALAR=$(echo "10 ^ $SIGFIG" | bc);

$HOME/.local/bin/polybar/coinquote.sh "ETH" | jq ".price, .percent_change_1h, .percent_change_24h, .percent_change_7d | . * $SCALAR | round | . / $SCALAR" | sed '1s/^/$/; 2,4s/$/%/' | tr '\n' ' ';
