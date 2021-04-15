ARG MANYLINUX_BASE=manylinux2014
ARG RUST_VERSION=1.51.0
ARG PLATFORM=x86_64
FROM quay.io/pypa/${MANYLINUX_BASE}_${PLATFORM}
WORKDIR /root
RUN cd /root
        && curl -O https://static.rust-lang.org/dist/rust-${RUST_VERSION}-${PLATFORM}-unknown-linux-gnu.tar.gz \
	&& tar xzf rust-${RUST_VERSION}-{PLATFORM}-unknown-linux-gnu.tar.gz \
	&& rust-${RUST_VERSION}-${PLATFORM}-unknown-linux-gnu/install.sh --components=rustc,cargo,rust-std-${PLATFORM}-unknown-linux-gnu \
	&& rm -rf rust-${RUST_VERSION}-${PLATFORM}-unknown-linux-gnu \
	&& rm -rf rust-${RUST_VERSION}-${PLATFORM}-unknown-linux-gnu.tar.gz
