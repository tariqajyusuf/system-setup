#!/usr/bin/env bash
# Installs 1Password (https://1password.com)

echo "[1Password] Checking if installed"
if which op > /dev/null; then
  exit 0
fi

echo "[1Password] Installing..."
brew install 1password > $OUTPUT
echo "[1Password] Installing CLI..."
brew install 1password-cli > $OUTPUT