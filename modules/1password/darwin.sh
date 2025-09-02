#!/usr/bin/env bash
# Installs 1Password (https://1password.com)

echo "[1Password] Checking if installed"
if which op > /dev/null; then
  exit 0
fi

echo "[1Password] Installing with CLI..."
brew install 1password 1password-cli > $OUTPUT
echo "[1Password] Installed! Open 1Password and sign in. You may want to also enable ssh-agent."