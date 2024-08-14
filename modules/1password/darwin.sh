#!/bin/bash
# Installs 1Password (https://1password.com)

echo "[1Password] Installing..."
rm -rf /tmp/system-setup/scratch/1password
mkdir -p /tmp/system-setup/scratch/1password
cd /tmp/system-setup/scratch/1password
curl -L -o iterm.zip "https://downloads.1password.com/mac/1Password.zip" &> $OUTPUT
echo "[1Password] Extracting files..." &> $OUTPUT
unzip iterm.zip &> $OUTPUT
echo "[1Password] Installing 1Password on your machine, you may get a sudo prompt"
open -n ./*.app &> $OUTPUT
echo "[1Password] Installing CLI..."
brew install 1password-cli &> $OUTPUT