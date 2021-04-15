ARG MANYLINUX_BASE=manylinux2014
ARG RUST_VERSION=1.51.0
ARG PLATFORM=x86_64
RUN echo manylinux: $MANYLINUX_BASE
RUN echo rust: $RUST_VERSION
RUN echo platform: $PLATFORM
FROM quay.io/pypa/${MANYLINUX_BASE}_${PLATFORM}
WORKDIR /root
RUN cd /root \
        && echo https://static.rust-lang.org/dist/rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
        && curl -O https://static.rust-lang.org/dist/rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
	&& tar xzf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
	&& rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu/install.sh --components=rustc,cargo,rust-std-$PLATFORM-unknown-linux-gnu \
	&& rm -rf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu \
	&& rm -rf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz
