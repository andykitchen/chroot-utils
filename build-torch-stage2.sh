#!/bin/sh

set -e

cd /tmp

export LC_ALL="C"
export DEBIAN_FRONTEND="noninteractive"

apt-get -y install git curl build-essential sudo

if ! id -u user; then
	adduser --uid 1000 --disabled-password --gecos "" user
fi

curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps \
	| sed "s|git clone https://github.com/xianyi/OpenBLAS.git -b master|git clone https://github.com/xianyi/OpenBLAS.git -b v0.2.14|" \
	| bash

#| sed "s/getconf _NPROCESSORS_ONLN/echo 12/" \
#| sed "s/make NO_AFFINITY=1 USE_OPENMP=1/make -j12 NO_AFFINITY=1 USE_OPENMP=1 NUM_THREADS=6/" \

exec su -c "sh /tmp/build-torch-stage3.sh" user
