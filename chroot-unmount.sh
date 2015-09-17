#!/bin/sh

root="$1"

umount $root/sys
umount $root/proc
umount $root/dev/pts
umount $root/dev
