#!/bin/sh

printf "%02d" "$(nvidia-smi --id=0 --query-gpu=utilization.gpu --format=csv,noheader,nounits)"
