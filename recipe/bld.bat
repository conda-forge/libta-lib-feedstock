setlocal EnableDelayedExpansion

cd src

mkdir build

cd build
mkdir out

cmake ..
cmake --build .

cmake --install . --prefix=%PREFIX%
