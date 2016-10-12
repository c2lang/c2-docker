c2-docker
=========
Simplified build process of c2compiler.

Usage
=====
You should have a relatively recent version of Docker before proceeding.
Head over [here](https://docs.docker.com/engine/installation/) for the
installation documents.

```bash
git clone --recursive https://github.com/ckaygusu/c2-docker
cd c2-docker
make
```

The compiled content should appear under `build` directory.


Updating
========

```bash
git submodule update --recursive --remote
```

Running a shell for debugging
=============================
```bash
docker run -it --entrypoint=/bin/bash c2_compiler_image -i
```

