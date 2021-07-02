# mini-docker-rust [![travis][travis-image]][travis-url]

[travis-image]: https://img.shields.io/travis/kpcyrd/mini-docker-rust/master.svg
[travis-url]: https://travis-ci.org/kpcyrd/mini-docker-rust

Very small rust docker image.

This is an example project on how to build very small docker images for a rust project. The resulting image for a working hello world was about 6.01MB during my tests.

This repo is trying to keep the docker overhead to a minimum without sacrificing performance or the usability implications of using `FROM scratch`. If you want to reduce the binary size further you might be interested in [johnthagen/min-sized-rust](https://github.com/johnthagen/min-sized-rust).

## See for yourself

You don't need to install anything besides docker. Build with `docker build -t mini-docker-rust .` and run with `docker run mini-docker-rust`.

## Annotated docker file

See [Dockerfile](Dockerfile).
