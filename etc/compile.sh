#!/bin/bash
set -e

# Build clang
mkdir -p /root/llvm-build
cd /root/llvm-build
../llvm/configure --enable-optimizedd --prefix=/root/llvm-c2 --with-python=/usr/bin/python2.7
make -j8
make install

# Build C2C
mkdir -p /root/c2-build
cd /root/c2-build
cmake . /root/c2compiler/c2c
make -j8
