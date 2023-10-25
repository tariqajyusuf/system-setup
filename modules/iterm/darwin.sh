#!/bin/bash
# Visual Studio Code (https://code.visualstudio.com)

echo "[iTerm] Downloading iTerm..."
rm -rf /tmp/system-setup/scratch/iterm
mkdir -p /tmp/system-setup/scratch/iterm
cd /tmp/system-setup/scratch/iterm
curl -L -o iterm.zip "https://iterm2.com/downloads/stable/latest" &> $OUTPUT
echo "[iTerm] Extracting files..."
unzip iterm.zip &> $OUTPUT
echo "[iTerm] Installing iTerm on your machine, you may get a sudo prompt"
sudo mv iTerm.app/ /Applications &> $OUTPUT