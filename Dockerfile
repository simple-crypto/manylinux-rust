ARG MANYLINUX_BASE=manylinux2014
ARG RUST_VERSION=1.66.1
ARG PLATFORM=x86_64
FROM quay.io/pypa/${MANYLINUX_BASE}_${PLATFORM}
ARG MANYLINUX_BASE
ARG RUST_VERSION
ARG PLATFORM
RUN echo manylinux: $MANYLINUX_BASE
RUN echo rust: $RUST_VERSION
RUN echo platform: $PLATFORM
RUN cd /root \
        && echo https://static.rust-lang.org/dist/rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
        && curl -O https://static.rust-lang.org/dist/rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
	&& tar xzf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
	&& rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu/install.sh --components=rustc,cargo,rust-std-$PLATFORM-unknown-linux-gnu \
	&& rm -rf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu \
	&& rm -rf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz
