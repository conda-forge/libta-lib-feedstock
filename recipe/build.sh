#!/bin/bash

set -e -x

cmake ${CMAKE_ARGS} -S. -Bbuild -G Ninja
cmake --build build
cmake --install build
