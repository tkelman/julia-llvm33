FROM tkelman/julia-openblas
MAINTAINER Tony Kelman <tony@kelman.net>

RUN for ARCH in i686 x86_64; do \
      cd /home/julia-$ARCH && make -j2 -C deps install-llvm && \
      make -j2 -C deps distclean-llvm; \
    done
# distclean-llvm should leave in place the installed libraries and headers
