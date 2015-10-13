FROM ubuntu:14.04
MAINTAINER Tony Kelman <tony@kelman.net>

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates git \
        build-essential gcc-multilib g++-multilib python curl && \
    git clone https://github.com/JuliaLang/julia /home/julia32 && \
    cp -R /home/julia32 /home/julia64 && \
    echo 'override ARCH = i686' >> /home/julia32/Make.user && \
    echo 'override MARCH = pentium4' >> /home/julia32/Make.user && \
    cd /home/julia32 && make -j4 -C deps install-llvm && \
    cd /home/julia64 && make -j4 -C deps install-llvm
