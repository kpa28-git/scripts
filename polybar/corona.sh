#!/bin/sh
# USA state corona facts
# Dependencies: ping, curl, grep, sed, awk

getreport() {
	curl -s 'https://corona-stats.online/states/us' > "$XDG_DATA_HOME/coronareport" || exit 1;
}

showreport() {
	grep "$1" "$XDG_DATA_HOME/coronareport" | sed "s/\s*//g; s/║//g; s/│/;/g; s/\x1b\[[0-9;]*m//g" | awk -F';' '{print $3 " (" $5")"}';
}

ping -q -c 1 9.9.9.9 > /dev/null || (printf '' && exit 1);
getreport;
showreport "$1";
