#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./src

pushd src

./configure --prefix=$PREFIX
make
make install
