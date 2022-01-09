# Start with a rust alpine image
FROM rust:1.57-alpine
# This is important, see https://github.com/rust-lang/docker-rust/issues/85
ENV RUSTFLAGS="-C target-feature=-crt-static"
# if needed, add additional dependencies here
RUN apk add --no-cache musl-dev
# set the workdir and copy the source into it
WORKDIR /app
COPY ./ /app
# do a release build
RUN cargo build --release
RUN strip target/release/mini-docker-rust

# use a plain alpine image, the alpine version needs to match the builder
FROM alpine:3.15
# if needed, install additional dependencies here
RUN apk add --no-cache libgcc
# copy the binary into the final image
COPY --from=0 /app/target/release/mini-docker-rust .
# set the binary as entrypoint
ENTRYPOINT ["/mini-docker-rust"]
