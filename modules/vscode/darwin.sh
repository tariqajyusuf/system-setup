#!/usr/bin/env bash
# Visual Studio Code (https://code.visualstudio.com)

echo "[VSCode] Checking if installed"
if which code ; then
  exit 0
fi

echo "[VSCode] Downloading VSCode for darwin-universal"
rm -rf /tmp/system-setup/scratch/vscode
mkdir -p /tmp/system-setup/scratch/vscode
cd /tmp/system-setup/scratch/vscode
curl -L -o vscode.zip https://code.visualstudio.com/sha/download\?build\=stable\&os\=darwin-universal > $OUTPUT
echo "[VSCode] Extracting files..."
unzip vscode.zip > $OUTPUT
echo "[VSCode] Installing VSCode on your machine, you may get a sudo prompt"
$SUDO mv Visual\ Studio\ Code.app/ /Applications > $OUTPUT
echo "[VSCode] Installed! Log into Settings Sync to pull your settings."