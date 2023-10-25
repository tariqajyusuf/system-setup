#!/bin/sh
# Visual Studio Code (https://code.visualstudio.com)

if [ which apt ] ; then
  echo "[VSCode] Downloading VSCode for linux-deb-x64"
  curl -L -O https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 >> vscode.deb
  echo "[VSCode] Installing VSCode on your machine, you may get a sudo prompt"
  sudo apt install vscode.deb
else
  echo "[VSCode] Downloading VSCode for linux64cli"
  curl -L -O https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64 >> vscode.tar.gz
  echo "[VSCode] Extracting files..."
  tar -xzf vscode.tar.gz
  echo "[VSCode] Installing VSCode on your machine, you may get a sudo prompt"
  mv code /usr/bin
fi

echo "[VSCode] Installed! Log into Settings Sync to pull your settings."