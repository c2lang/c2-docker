all: cmake-3.5.2-Linux-x86_64.tar.gz
	docker build -t c2_compiler_image .
	docker run -v $(CURDIR)/build:/root/c2-build -v ${CURDIR}/build_llvm:/root/llvm-c2 c2_compiler_image


cmake-3.5.2-Linux-x86_64.tar.gz:
	@wget https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz

shell:
	@docker run -it --entrypoint=/bin/bash c2_compiler_image -i
