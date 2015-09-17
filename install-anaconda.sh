#!/bin/bash

set -e

CHROOT="$1"
INSTALLER=Anaconda-2.3.0-Linux-x86_64.sh

if [ ! -e $CHROOT/proc/self/exe ]; then
  ./chroot-mount.sh $CHROOT
fi

cp --reflink=auto tmp/$INSTALLER $CHROOT/tmp
HOME=/home/user chroot --userspec=user:user $CHROOT bash /tmp/$INSTALLER -b

echo 'export PATH="$HOME/anaconda/bin:$PATH"' >> $CHROOT/home/user/.profile
