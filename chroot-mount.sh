#!/bin/sh

CHROOT="$1"

mount --bind /dev     $CHROOT/dev
mount --bind /dev/pts $CHROOT/dev/pts
mount --bind /proc    $CHROOT/proc
mount --bind /sys     $CHROOT/sys
