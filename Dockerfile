FROM buildpack-deps:xenial

MAINTAINER Zhengyi Xu (zhengyixu) <zhengyi123@gmail.com>

RUN apt-get update && apt-get install --no-install-recommends -y \
    bc \
    bison \
    gawk \
    flex \
    gawk \
    gperf \
    patchutils \
    texinfo

ENV RISCV /opt/riscv
ENV NUMJOBS 1
RUN mkdir -p $RISCV

# Add the GNU utils bin folder to the path.
ENV PATH $RISCV/bin:$PATH

WORKDIR /tmp
RUN set -x && \
    git clone https://github.com/riscv/riscv-tools.git && \
    cd riscv-tools && \
    git submodule update --init \
       --recursive riscv-fesvr riscv-gnu-toolchain riscv-isa-sim riscv-opcodes riscv-pk riscv-tests && \
    ./build.sh && \
    cd riscv-gnu-toolchain && \
    ./configure --prefix=$RISCV && make linux && \
    rm -rf /tmp/*

#WORKDIR /tmp
#RUN set -x && \
#    mkdir linux-4.1.y && cd linux-4.1.y && git init && \
#    git remote add origin https://github.com/riscv/riscv-linux.git && \
#    git fetch && git checkout -b linux origin/linux-4.1.y-riscv && \
#    make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- defconfig && \
#    make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- vmlinux && \
#    mv vmlinux $RISCV && \
#    rm -rf /tmp/*

#WORKDIR /tmp
#RUN set -x && \
#    git clone git://git.busybox.net/busybox && cd busybox && \
#    git checkout -b 1_23_stable origin/1_23_stable
