#!/bin/sh

set -e

base=/var/chroot/trusty

export http_proxy=http://0.0.0.0:8000/ 
if [ ! -e $base ]; then
	btrfs subvolume create $base
	debootstrap --variant=buildd trusty $base \
		http://archive.ubuntu.com/ubuntu
fi
cp etc/apt/apt.conf.d/30localproxy $base/etc/apt/apt.conf.d/30localproxy
cp etc/apt/sources.list $base/etc/apt/sources.list
cp build-trusty-base-stage2.sh $base/tmp

exec chroot $base sh /tmp/build-trusty-base-stage2.sh
