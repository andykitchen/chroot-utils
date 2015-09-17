set -e

CHROOT="$1"

chroot $CHROOT adduser --uid 1000 --disabled-password --gecos "" user
