#!/bin/bash

set -e

CHROOT=/var/chroot/caffe
DATA_DIR=$CHROOT/data

. ./chroot-setup-cuda.sh

if ! mount | grep -q $CHROOT/dev; then
	./chroot-mount.sh $CHROOT
fi

if ! mount | grep -q $DATA_DIR; then
	mkdir -p $DATA_DIR
	mount --bind /data $DATA_DIR
fi
