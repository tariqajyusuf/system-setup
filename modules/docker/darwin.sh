#!/usr/bin/env bash
# Docker Desktop (https://www.docker.com/products/docker-desktop/)

PLATFORM=`uname -m`

echo "[Docker] Checking if installed"
if which docker ; then
  exit 0
fi

echo "[Docker] Installing..."
brew install docker-desktop > $OUTPUT