all:
	docker build -t c2_compiler_image .
	docker run -v $(CURDIR)/build:/root/c2-build c2_compiler_image
 
