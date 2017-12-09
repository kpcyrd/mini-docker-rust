FROM alpine:latest
COPY ./ /app
WORKDIR /app
RUN apk add --no-cache libgcc \
    && apk add --no-cache --virtual .build-rust rust cargo \
    && cargo build --release \
    && cp target/release/mini-docker-rust . \
    && rm -rf target/ ~/.cargo/ \
    && apk del --purge .build-rust
ENTRYPOINT ["./mini-docker-rust"]
