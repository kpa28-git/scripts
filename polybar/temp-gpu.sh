#!/bin/sh

nvidia-smi -q -d temperature | awk '/GPU Current Temp/ {print $5$6}';
