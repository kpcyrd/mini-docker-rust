# mini-docker-rust ![docker-github-action](https://github.com/kpcyrd/mini-docker-rust/actions/workflows/test-docker.yml/badge.svg)

Very small rust docker image.

This is an example project on how to build very small docker images for a rust project. The resulting image for a working `hello world` was 5.69MB in the case of Alpine 3.16. Alpine versions have changed in size with past releases (see below a table with historic sizes of the docker images). Using end-of-life Alpine/Rust releases is not advised (even if they might be slightly smaller). Checked sizes with `docker system df -v`

| Alpine      | Size   |
| ----------- | ------ |
| alpine:3.19 | 8.22MB |
| alpine:3.18 | 8.22MB | 
| alpine:3.17 | 7.95MB | 
| alpine:3.16 | 5.69MB | 
| alpine:3.15 | 5.74MB |
| alpine:3.14 | 5.73MB |

This repo is trying to keep the docker overhead to a minimum without sacrificing performance or the usability implications of using `FROM scratch`. If you want to reduce the binary size further you might be interested in [johnthagen/min-sized-rust](https://github.com/johnthagen/min-sized-rust).

## See for yourself

You don't need to install anything besides docker. Build with `docker build -t mini-docker-rust .` and run with `docker run mini-docker-rust`.

## Annotated docker file

See [Dockerfile](Dockerfile).
