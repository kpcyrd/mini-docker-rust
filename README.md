# mini-docker-rust [![CircleCI](https://circleci.com/gh/kpcyrd/mini-docker-rust/tree/main.svg?style=svg)](https://circleci.com/gh/kpcyrd/mini-docker-rust/tree/main)

Very small rust docker image.

This is an example project on how to build very small docker images for a rust project. The resulting image for a working hello world was about 6.01MB during my tests.

This repo is trying to keep the docker overhead to a minimum without sacrificing performance or the usability implications of using `FROM scratch`. If you want to reduce the binary size further you might be interested in [johnthagen/min-sized-rust](https://github.com/johnthagen/min-sized-rust).

## See for yourself

You don't need to install anything besides docker. Build with `docker build -t mini-docker-rust .` and run with `docker run mini-docker-rust`.

## Annotated docker file

See [Dockerfile](Dockerfile).
