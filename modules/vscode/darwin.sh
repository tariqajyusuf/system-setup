#!/bin/sh
# Visual Studio Code (https://code.visualstudio.com)

echo "[VSCode] Downloading VSCode for darwin-universal"
curl -L -O https://code.visualstudio.com/sha/download\?build\=stable\&os\=darwin-universal >> vscode.zip
echo "[VSCode] Extracting files..."
unzip vscode.zip
echo "[VSCode] Installing VSCode on your machine, you may get a sudo prompt"
sudo mv Visual\ Studio\ Code.app/ /Applications
echo "[VSCode] Installed! Log into Settings Sync to pull your settings."