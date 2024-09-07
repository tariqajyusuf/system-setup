#!/bin/bash
# Docker Desktop (https://www.docker.com/products/docker-desktop/)

PLATFORM=`uname -m`

echo "[Docker] Checking if installed"
if which docker ; then
  exit 0
fi

echo "[Docker] Downloading Docker Desktop for darwin-$PLATFORM"
rm -rf /tmp/system-setup/scratch/docker
mkdir -p /tmp/system-setup/scratch/docker
cd /tmp/system-setup/scratch/docker
curl -L -O "https://desktop.docker.com/mac/main/$PLATFORM/Docker.dmg" >> docker.dmg &> $OUTPUT
echo "[Docker] Mounting image..."
hdiutil attach docker.dmg &> $OUTPUT
cd /Volumes/Docker
echo "[Docker] Installing Docker on your machine, you may get a sudo prompt"
sudo mv Docker.app/ /Applications &> $OUTPUT