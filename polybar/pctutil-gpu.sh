#!/bin/sh

printf "%i\n" "$(nvidia-smi -q -d utilization | awk '/Gpu/ {print $3}' | head -1)";
