#!/bin/sh

set -e

export LC_ALL="C"

cd ~

if [ ! -e ~/caffe ]; then
	git clone https://github.com/BVLC/caffe.git ~/caffe
fi

cd ~/caffe

cp Makefile.config.example Makefile.config
make -j 12
