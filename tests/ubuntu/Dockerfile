# syntax=docker/dockerfile:1

FROM ubuntu:latest
COPY . /tmp/ubuntu-docker-test
RUN apt-get update
RUN apt-get install -y curl
RUN /tmp/ubuntu-docker-test/init.sh
CMD ["zsh", "/tmp/ubuntu-docker-test/tests/ubuntu/verify.sh"]