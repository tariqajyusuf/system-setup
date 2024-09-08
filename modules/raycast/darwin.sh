#!/usr/bin/env bash
# Raycast (https://raycast.com/)

echo "[Raycast] Downloading Raycast..."
rm -rf /tmp/system-setup/scratch/raycast
mkdir -p /tmp/system-setup/scratch/raycast
cd /tmp/system-setup/scratch/raycast
echo "[Raycast] Installing via homebrew..."
brew install --cask raycast &> $OUTPUT