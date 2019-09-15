# mini-docker-rust [![travis][travis-image]][travis-url]

[travis-image]: https://img.shields.io/travis/kpcyrd/mini-docker-rust/master.svg
[travis-url]: https://travis-ci.org/kpcyrd/mini-docker-rust

Very small rust docker image.

This is an example project on how to build very small docker images for a rust project. The resulting image for a working hello world was about 8.1MB during my tests.

## See for yourself

You don't need to install anything besides docker. Build with `docker build -t mini-docker-rust .` and run with `docker run mini-docker-rust`.

## Annotated docker file

See [Dockerfile](Dockerfile).
