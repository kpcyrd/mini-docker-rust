FROM alpine:edge
COPY ./ /app
WORKDIR /app
RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
	&& apk add --no-cache llvm-libunwind \
	&& apk add --no-cache --virtual .build-rust rust cargo \
	&& cargo build --release \
	&& cp target/release/foo . \
	&& rm -rf target/ \
	&& apk del --purge .build-rust
ENTRYPOINT ["./foo"]
