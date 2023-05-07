#!/bin/sh

nvidia-smi --id=0 --query-gpu=memory.used --format=csv,noheader
