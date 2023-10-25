#!/bin/bash
# Docker Desktop (https://www.docker.com/products/docker-desktop/)

PLATFORM=`uname -m`

echo "[Docker] Downloading Docker Desktop for darwin-$PLATFORM"
rm -rf /tmp/system-setup/scratch/docker
mkdir -p /tmp/system-setup/scratch/docker
cd /tmp/system-setup/scratch/docker
curl -L -O "https://desktop.docker.com/mac/main/$PLATFORM/Docker.dmg" >> docker.dmg &> $OUTPUT
echo "[VSCode] Mounting image..."
hdiutil attach docker.dmg &> $OUTPUT
cd /Volumes/Docker
echo "[VSCode] Installing Docker on your machine, you may get a sudo prompt"
sudo mv Docker.app/ /Applications &> $OUTPUT