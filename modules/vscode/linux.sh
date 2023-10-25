#!/bin/bash
# Visual Studio Code (https://code.visualstudio.com)

PLATFORM=`uname -m`

# Special case for aarch64 which should be treated as just ARM
if [ $PLATFORM -eq "aarch64" ]; then PLATFORM="arm64"; fi

echo "[VSCode] Detecting linux version"
rm -rf /tmp/system-setup/scratch/vscode
mkdir -p /tmp/system-setup/scratch/vscode
cd /tmp/system-setup/scratch/vscode
if which apt; then
  echo "[VSCode] Downloading VSCode for linux-deb-$PLATFORM"
  curl -L -o vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-$PLATFORM" &> $OUTPUT
  echo "[VSCode] Installing VSCode on your machine, you may get a sudo prompt"
  apt install ./vscode.deb &> $OUTPUT
else
  echo "[VSCode] Downloading VSCode for linux64cli"
  curl -L -o vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-$PLATFORM" &> $OUTPUT
  echo "[VSCode] Extracting files..."
  tar -xzf vscode.tar.gz &> $OUTPUT
  echo "[VSCode] Installing VSCode on your machine, you may get a sudo prompt"
  mv code /usr/bin &> $OUTPUT
fi

echo "[VSCode] Installed! Log into Settings Sync to pull your settings."