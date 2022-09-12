#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./unix

pushd unix

./configure --prefix=$PREFIX
make
make install
