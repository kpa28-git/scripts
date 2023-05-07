#!/bin/sh

# printf "%.3g GB\n" "$(nvidia-smi -q -d memory | awk '/Used/ {print $3/1024}' | head -1)";
nvidia-smi --id=0 --query-gpu=memory.used --format=csv,noheader