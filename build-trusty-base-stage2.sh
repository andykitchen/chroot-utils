#!/bin/sh

set -e

cd /tmp

export LC_ALL="C"
export DEBIAN_FRONTEND="noninteractive"

apt-get -y update
apt-get -y install build-essential git wget curl sudo
