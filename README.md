# mini-docker-rust [![travis][travis-image]][travis-url]

[travis-image]: https://img.shields.io/travis/kpcyrd/mini-docker-rust/master.svg
[travis-url]: https://travis-ci.org/kpcyrd/mini-docker-rust

Very small rust docker image.

This is an example project on how to build very small docker images for a rust project. The resulting image for a working hello world was about 5.87MB during my tests.

## See for yourself

You don't need to install anything besides docker. Build with `docker build -t mini-docker-rust .` and run with `docker run mini-docker-rust`.

## Annotated docker file

```
# Start with alpine as base image
FROM alpine:latest
# Copy our project into the image (see .dockerignore for exclusions)
COPY ./ /app
# Switch the current directory to /app
WORKDIR /app
# This does multiple things in one go to keep the image size and layer number extremly low:
# llvm-libunwind is required to run the final rust binary, so we install it first
RUN apk add --no-cache llvm-libunwind \
    # Next, we install rust and cargo and tag them in a virtual package called `.build-rust`
    && apk add --no-cache --virtual .build-rust rust cargo \
    # Finally, we build our project
    && cargo build --release \
    # After that we copy our binary to the project root (you need to adjust this to your project)
    && cp target/release/mini-docker-rust . \
    # And discard the target/ directory so it won't bloat our image
    && rm -rf target/ \
    # As the final cleanup step we uninstall our virtual package
    # This uninstalls cargo, rust and all dependencies that aren't needed anymore so they won't end up in the final image
    && apk del --purge .build-rust
# Finally, we configure our binary as entrypoint (you need to adjust this too)
ENTRYPOINT ["./mini-docker-rust"]
```
