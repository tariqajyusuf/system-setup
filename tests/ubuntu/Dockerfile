# syntax=docker/dockerfile:1

FROM ubuntu:latest
COPY . /tmp/ubuntu-docker-test
COPY .git /tmp/ubuntu-docker-test/.git
RUN apt update
RUN apt install -y curl
CMD /tmp/ubuntu-docker-test/init.sh && /tmp/ubuntu-docker-test/tests/ubuntu/verify.sh