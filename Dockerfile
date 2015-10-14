FROM tkelman/julia-openblas
MAINTAINER Tony Kelman <tony@kelman.net>

RUN cd /home/julia-i686 && make -j2 -C deps install-llvm && \
    cd /home/julia-x86_64 && make -j2 -C deps install-llvm && \
    cd /home/julia-i686 && make -j2 -C deps distclean-llvm && \
    cd /home/julia-x86_64 && make -j2 -C deps distclean-llvm
# distclean-llvm should leave in place the installed libraries and headers
