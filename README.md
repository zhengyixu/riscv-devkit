## riscv-devkit

Inspired by the wonderful works of [sbates130272/docker-riscv](https://github.com/sbates130272/docker-riscv), 
[coldnew's blog](http://coldnew.github.io), and of course [Berkley RISC-V](https://github.com/riscv).

This Dockerfile can be used to create a development environment 
with open source RISC-V Tools (GNU Toolchain, ISA Simulator, Tests), RISC-V Linux, etc

Since the base image is based on official Docker image [buildpack-deps](https://registry.hub.docker.com/_/buildpack-deps/)
xenial (Ubuntu 16.04) version, it also contains common tools, like curl, wget, git, gcc, perl, python, etc.

Quote [the Docker Hub page](https://registry.hub.docker.com/_/buildpack-deps/):
>In spirit, buildpack-deps is similar to Heroku's stack images. It includes a large number of 
>"development header" packages needed by various things like Ruby Gems, PyPI modules, etc.

### Work in progress!

**Due to compilation error using buildpack-deps base image, using Ubuntu:latest for now**

Use following shell command to play with different dockerfile:
```
$ docker build -f dockerfile-name -t your-image-tag .
```

If there's anything wrong, use following commands to find your container IDs, and delete the container:

```
$ docker ps -a
$ docker rm your-bad-container-id
```
and image IDs, and delete the image you don't like

```
$ docker images
$ docker rmi your-bad-image-id
```

**Broke Dockerfile into smaller pieces, so when one step failed, we can just reuse previous
images, and rebuild just the failed one**

We can use a simple shell script for this.
```
$ ./build_riscvkit.sh 1
```
will build an image according to Dockerfile.1, and the tag will be zhengyixu/riscv-devkit-1.

You can change the tag name to whatever is good for you in the script.

If there's no argument passed to the script, Dockerfile will be invoked to create zhengyixu/riscv-devkit.
