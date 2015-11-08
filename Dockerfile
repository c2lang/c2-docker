FROM ubuntu:14.04

MAINTAINER ckaygusu@gmail.com

ENV PATH "$PATH:/root/llvm-c2/bin:/root/c2_build"

RUN apt-get update && \
	apt-get install -y \
		build-essential \
		python2.7-minimal \
		cmake \
		groff \
		libtinfo-dev		

ADD llvm /root/llvm
ADD compiler-rt root/llvm/projects/compiler-rt
ADD clang /root/llvm/tools/clang
ADD c2compiler /root/c2compiler

# Make LLVM
RUN mkdir llvm-build
WORKDIR /root/llvm-build
RUN ../llvm/configure --enable-optimized  --prefix=/root/llvm-c2 --with-python=/usr/bin/python2.7
RUN make -j4
RUN make install

# Make C2C
RUN mkdir /root/c2_build
WORKDIR /root/c2_build 
RUN cmake . /root/c2compiler/c2c
RUN make -j4


