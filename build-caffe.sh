#!/bin/sh

set -e

base=/var/chroot/cuda
target=/var/chroot/caffe

if [ ! -e $target ]; then
	btrfs subvolume snapshot $base $target
fi

cp build-caffe-stage2.sh $target/tmp
cp build-caffe-stage3.sh $target/tmp
exec chroot $target sh /tmp/build-caffe-stage2.sh
