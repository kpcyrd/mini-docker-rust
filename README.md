# mini-docker-rust

Very small rust docker image.

This is an example project on how to build very small docker images for a rust project. The resulting image for a working hello world was about 6.55MB during my tests.

## See for yourself

You don't need to install anything besides docker. Build with `docker build -t mini-docker-rust .` and run with `docker build -t mini-docker-rust`.

## Annotated docker file

```
# Start with alpine edge as a base image. (edge is required at the point of writing)
FROM alpine:edge
# Copy our project into the image (see .dockerignore for exclusions)
COPY ./ /app
# Switch the current directory to /app
WORKDIR /app
# This does multiple things in one go to keep the image size and layer number extremly low:
# First we enable the testing repo (required at the point of writing)
RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
	# llvm-libunwind is required to run the final rust binary, so we install it first
	&& apk add --no-cache llvm-libunwind \
	# Next, we install rust and cargo and tag them in a virtual package called `.build-rust`
	&& apk add --no-cache --virtual .build-rust rust cargo \
	# Finally, we build our project
	&& cargo build --release \
	# After that we copy our binary to the project root (you need to adjust this to your project)
	&& cp target/release/foo . \
	# And discard the target/ directory so it won't bloat our image
	&& rm -rf target/ \
	# As the final cleanup step we uninstall our virtual package
	# This uninstalls cargo, rust and all dependencies that aren't needed anymore so they won't end up in the final image
	&& apk del --purge .build-rust
# Finally, we configure our binary as entrypoint (you need to adjust this too)
ENTRYPOINT ["./foo"]
```
