#!/bin/bash

set -e

CHROOT="$1"
TAR=cudnn-7.0-linux-x64-v3.0-rc.tgz

tar -C $CHROOT/usr/local -xzf tmp/$TAR
chroot $CHROOT ldconfig
