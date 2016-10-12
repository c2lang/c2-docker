FROM ubuntu:14.04

MAINTAINER ckaygusu@gmail.com

ENV PATH "/root/cmake-3.5.2-Linux-x86_64/bin:/root/llvm-c2/bin:/root/c2_build:$PATH"

RUN apt-get update && \
	apt-get install -y \
		build-essential \
		python2.7-minimal \
		groff \
		libtinfo-dev

#ADD https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz /root
ADD cmake-3.5.2-Linux-x86_64.tar.gz /root
ADD llvm /root/llvm
ADD compiler-rt root/llvm/projects/compiler-rt
ADD clang /root/llvm/tools/clang
ADD c2compiler /root/c2compiler
ADD etc /root/etc

CMD /root/etc/compile.sh

