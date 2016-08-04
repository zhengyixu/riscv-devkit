#!/bin/sh

set -x
if [ "$1" != "" ]
then
	docker build -f Dockerfile.$1 -t zhengyixu/riscv-devkit-$1 .
else
	docker build -f Dockerfile -t zhengyixu/riscv-devkit .
fi
