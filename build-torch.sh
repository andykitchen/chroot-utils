#!/bin/sh

set -e

base=/var/chroot/cuda
target=/var/chroot/torch

if [ ! -e $target ]; then
	btrfs subvolume snapshot $base $target
fi

cp build-torch-stage2.sh $target/tmp
cp build-torch-stage3.sh $target/tmp

if [ ! -e $CHROOT/sys/devices/system/cpu/online ]; then
	mount --bind /sys $CHROOT/sys
fi

exec chroot $target sh /tmp/build-torch-stage2.sh
