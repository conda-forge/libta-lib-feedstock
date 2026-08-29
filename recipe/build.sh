#!/bin/bash

set -e -x

export CFLAGS="${CFLAGS} -D_GNU_SOURCE"

cmake ${CMAKE_ARGS} -S. -Bbuild -G Ninja
cmake --build build
cmake --install build
