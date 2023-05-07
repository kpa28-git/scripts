#!/bin/sh

nvidia-smi -q -d utilization | awk '/Gpu/ {printf "%02i", $3}';
