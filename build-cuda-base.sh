#!/bin/sh

set -e

base=/var/chroot/trusty
target=/var/chroot/cuda

btrfs subvolume snapshot $base $target
cp tmp/cuda-repo-ubuntu1404_7.5-18_amd64.deb $target/tmp
cp etc/ld.so.conf.d/cuda.conf $target/etc/ld.so.conf.d
cp build-cuda-base-stage2.sh $target/tmp

exec chroot $target sh /tmp/build-cuda-base-stage2.sh
