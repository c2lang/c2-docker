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
ADD etc /root/etc

CMD /root/etc/compile.sh

