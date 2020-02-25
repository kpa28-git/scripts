#!/bin/sh
#                     _
#    _________  _____(_)_______
#   / ___/ __ \/ ___/ / ___/ _ \
#  / /__/ /_/ / /  / / /__/  __/
#  \___/ .___/_/  /_/\___/\___/
#     /_/
# Coin price query script.
#
# Commandline Args:
# 	* -f (significant figures), The number of sigfigs to output, uses 2 by default.
# 	* -s (symbol), valid Coinmarketcap symbol (ie 'ETH')
# Dependencies: coinquote, bc, sed, curl, jq
# Outputs Format: $<price> <1 hr pct>% <24hr pct>% <7d pct>%
# Just a wrapper around coinquote.sh for polybar (queries Coinmarketcap API).

sign() {
	echo "var=$1;if(var<0) print -1 else if(var>0) print 1 else print 0" | bc;
}

pb_sign_color() {
	case "$(sign "$1")" in
		'-1') echo '%{F#CD0000}';;
		'1') echo '%{F#00CD00}';;
		*) echo '';;
	esac;
}

coin_price() {
	SIGFIG="$1";
	SYMBOL="$2";
	SCALAR=$(echo "10 ^ $SIGFIG" | bc);

	QUOTE=$(coinquote "$SYMBOL" | jq ".price, .percent_change_1h, .percent_change_24h, .percent_change_7d | . * $SCALAR | round | . / $SCALAR");
	CLOSE_LATEST=$(echo $QUOTE | awk '{print $1}');
	PCT_01HR=$(echo $QUOTE | awk '{print $2}');
	PCT_24HR=$(echo $QUOTE | awk '{print $3}');
	PCT_07DAY=$(echo $QUOTE | awk '{print $4}');

	echo "\$$CLOSE_LATEST $(pb_sign_color "$PCT_01HR")$PCT_01HR% $(pb_sign_color "$PCT_24HR")$PCT_24HR% $(pb_sign_color "$PCT_07DAY")$PCT_07DAY%" | tr '\n' ' ';
}


# Defaults:
SIGFIG=2;
SYMBOL='ETH';

while getopts 'f:s:' arg; do
	case $arg in
		f) SIGFIG="$OPTARG";;
		s) SYMBOL="$OPTARG";;
		*) notify-send "cprice" "invalid flag";;
	esac;
done;

coin_price "$SIGFIG" "$SYMBOL";

