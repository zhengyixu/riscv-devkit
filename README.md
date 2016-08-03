## riscv-devkit

This Dockerfile can used to create a development environment 
with open source RISC-V Tools (GNU Toolchain, ISA Simulator, Tests), RISC-V Linux, etc

Since the base image is based on official Docker image [buildpack-deps](https://registry.hub.docker.com/_/buildpack-deps/)
xenial (Ubuntu 16.04) version, it also contains common tools, like curl, wget, git, gcc, perl, python, etc.

Quote [the Docker Hub page](https://registry.hub.docker.com/_/buildpack-deps/):
>In spirit, buildpack-deps is similar to Heroku's stack images. It includes a large number of 
>"development header" packages needed by various things like Ruby Gems, PyPI modules, etc.

### Work in progress!
