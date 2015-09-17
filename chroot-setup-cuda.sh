#!/bin/bash

set -e

modprobe nvidia-uvm

if [ ! -e /dev/nvidia-uvm ]; then
	mknod /dev/nvidia-uvm c 246 0
	chmod 0666 /dev/nvidia-uvm
fi

# nvidia-modprobe
# nvidia-modprobe -u
