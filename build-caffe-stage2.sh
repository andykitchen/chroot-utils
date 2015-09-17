#!/bin/sh

set -e

cd /tmp

export LC_ALL="C"
export DEBIAN_FRONTEND="noninteractive"

if ! id -u user; then
	adduser --uid 1000 --disabled-password --gecos "" user
fi

apt-get -y install \
	git \
	libprotobuf-dev \
	protobuf-compiler \
	python-dev \
	libboost-dev \
	libboost-thread-dev \
	libboost-system-dev \
	libboost-python-dev \
	libgflags-dev \
	libgoogle-glog-dev \
	liblmdb-dev \
	libleveldb-dev \
	libsnappy-dev \
	libhdf5-dev \
	libopencv-dev \
	libatlas-base-dev \

exec su -c "sh /tmp/build-caffe-stage3.sh" user
