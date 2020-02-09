#!/bin/sh
#                 __________  ____             _
#     _________  / ____/ __ \/ __ \____  _____(_)_______
#    / ___/ __ \/___ \/ / / / / / / __ \/ ___/ / ___/ _ \
#   (__  ) /_/ /___/ / /_/ / /_/ / /_/ / /  / / /__/  __/
#  /____/ .___/_____/\____/\____/ .___/_/  /_/\___/\___/
#      /_/                     /_/
# S&P500 price query script.
#
# Just a wrapper around alphaquote.sh for polybar (queries Alpha Vantage API).
# Optional commandline argument (frequency), valid values in {1, 5, 15, 30, 60}.
# Dependencies: alphaquote, bc, sed, awk, curl
# Outputs Format: $<price> <since open pct>% <1 hr pct>% <24hr pct>% <7d pct>%

ceil_div() {
	echo "($1 + $2 - 1)/$2" | bc;
}

pct_change() {
	echo "scale=4; ($1 / $2 - 1) * 100" | bc;
}

FREQ=$([ -n "$1" ] && echo "$1" || echo "5");
PER_HR=$(echo "60/$FREQ" | bc);
ADDN=$(ceil_div "$PER_HR" 2)
PER_DAY=$(echo "6 * $PER_HR + $ADDN" | bc)

IDX_LATEST=2;
IDX_01HR=$(echo "$PER_HR + 2" | bc);
IDX_24HR=$(echo "$PER_DAY + 2" | bc);
IDX_07DAY=$(echo "$PER_DAY * 5 + 2" | bc);

DATA=$(alphaquote "$FREQ" "SPX" | sed "$IDX_07DAY"q);
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

echo "\$$CLOSE_LATEST $PCT_01HR% $PCT_24HR% $PCT_07DAY%" | tr '\n' ' ';

