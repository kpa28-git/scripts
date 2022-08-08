#!/bin/sh
#                      _
#     _________  _____(_)_______
#    / ___/ __ \/ ___/ / ___/ _ \
#   (__  ) /_/ / /  / / /__/  __/
#  /____/ .___/_/  /_/\___/\___/
#      /_/
# Security price query script.
#
# Commandline Args:
# 	* -f (frequency), valid values in {1, 5, 15, 30, 60}.
# 	* -s (symbol), valid Alpha Vantage symbol (ie '^SPX')
# 	* -a (always run): if supplied doesn't not check if it is market time
# Dependencies: alphaquote, bc, sed, awk, curl
# Outputs Format: $<price> <1 hr pct>% <24hr pct>% <7d pct>%
# Just a wrapper around alphaquote.sh for polybar (queries Alpha Vantage API).

ceil_div() {
	echo "($1 + $2 - 1)/$2" | bc;
}

pct_change() {
	echo "scale=4; ($1 / $2 - 1) * 100" | bc;
}

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

security_price() {
	FREQ="$1";
	SYMBOL="$2";
	PER_HR=$(echo "60/$FREQ" | bc);
	ADDN=$(ceil_div "$PER_HR" 2)
	PER_DAY=$(echo "6 * $PER_HR + $ADDN" | bc)

	IDX_LATEST=2;
	IDX_01HR=$(echo "$PER_HR + 2" | bc);
	IDX_24HR=$(echo "$PER_DAY + 2" | bc);
	IDX_07DAY=$(echo "$PER_DAY * 5 + 2" | bc);

	DATA=$(alphaquote "$FREQ" "$SYMBOL" | sed "$IDX_07DAY"q);
	OHLCV_LATEST=$(echo "$DATA" | sed -n "$IDX_LATEST"p);
	OHLCV_01HR=$(echo "$DATA" | sed -n "$IDX_01HR"p);
	OHLCV_24HR=$(echo "$DATA" | sed -n "$IDX_24HR"p);
	OHLCV_07DAY=$(echo "$DATA" | sed -n "$IDX_07DAY"p);

	#OPEN_LATEST=$(echo "$OHLCV_LATEST" | awk -F ',' '{print $2}');
	CLOSE_LATEST=$(echo "$OHLCV_LATEST" | awk -F ',' '{print $5}' | sed 's/.\{2\}$//');
	CLOSE_01HR=$(echo "$OHLCV_01HR" | awk -F ',' '{print $5}');
	CLOSE_24HR=$(echo "$OHLCV_24HR" | awk -F ',' '{print $5}');
	CLOSE_07DAY=$(echo "$OHLCV_07DAY" | awk -F ',' '{print $5}');

	#PCT_LATEST=$(pct_change "$CLOSE_LATEST" "$OPEN_LATEST" | sed 's/.\{2\}$//');
	PCT_01HR=$(pct_change "$CLOSE_LATEST" "$CLOSE_01HR" | sed 's/.\{2\}$//');
	PCT_24HR=$(pct_change "$CLOSE_LATEST" "$CLOSE_24HR" | sed 's/.\{2\}$//');
	PCT_07DAY=$(pct_change "$CLOSE_LATEST" "$CLOSE_07DAY" | sed 's/.\{2\}$//');

	echo "\$$CLOSE_LATEST $(pb_sign_color "$PCT_01HR")$PCT_01HR% $(pb_sign_color "$PCT_24HR")$PCT_24HR% $(pb_sign_color "$PCT_07DAY")$PCT_07DAY%" | tr '\n' ' ';
}

# Defaults:
FREQ=5;
SYMBOL='^SPX';
ALWAYS_RUN=1;

while getopts 'f:s:a' arg; do
	case $arg in
		f) FREQ="$OPTARG";;
		s) SYMBOL="$OPTARG";;
		a) ALWAYS_RUN=0;;
		*) notify-send 'sprice' 'invalid flag';;
	esac;
done;

FPATH="/var/tmp/$SYMBOL.txt";
CUR_UTC=$(date -u +'%H%M');

if [ "$ALWAYS_RUN" -eq 0 ] || [ ! -f "$FPATH" ] || [ "$CUR_UTC" -gt 1400 ] && [ "$CUR_UTC" -lt 2200 ] ; then
	ping -q -c 1 9.9.9.9 >/dev/null 2>&1 || (printf '' && exit 1)
	security_price "$FREQ" "$SYMBOL" > "$FPATH";
fi;

cat "$FPATH" && exit 0;
