#!/bin/sh

set -e

cd /tmp

RT_VERSION=352
VERSION=7-5
VERSION_DOT=7.5

export LC_ALL="C"
export DEBIAN_FRONTEND="noninteractive"

apt-get -y install wget
dpkg -i cuda-repo-*.deb
apt-get -y update
apt-get -y install \
	libcuda1-$RT_VERSION \
	cuda-minimal-build-$VERSION \
	cuda-cublas-dev-$VERSION \
	cuda-curand-dev-$VERSION
# apt-get install -y cuda
ln -s cuda-$VERSION_DOT /usr/local/cuda
ldconfig
