#!/bin/sh

set -e

export LC_ALL="C"

cd $HOME

PATH="/usr/local/cuda/bin:$PATH"
git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; ./install.sh -b
