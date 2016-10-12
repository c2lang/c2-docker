#!/bin/bash
set -e

# Build clang
mkdir -p /root/llvm-build
cd /root/llvm-build
cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DLLVM_ENABLE_ASSERTIONS=OFF \
    -DCMAKE_INSTALL_PREFIX=/root/llvm-c2 \
    -DLLVM_ENABLE_PEDANTIC=OFF \
    ../llvm
make -j4
make install

# Build c2c
cd /root/c2compiler
source ./env.sh
mkdir -p /root/c2-build
cd /root/c2-build
cmake . /root/c2compiler/
make -j4
