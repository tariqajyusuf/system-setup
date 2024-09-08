#!/usr/bin/env bash
# Installs 1Password (https://1password.com)

echo "[1Password] Checking if installed"
if which op ; then
  exit 0
fi

echo "[1Password] Adding Deb repository"
curl -sS https://downloads.1password.com/linux/keys/1password.asc | $SUDO gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg > $OUTPUT
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | $SUDO tee /etc/apt/sources.list.d/1password.list > $OUTPUT
$SUDO mkdir -p /etc/debsig/policies/AC2D62742012EA22/ > $OUTPUT
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | $SUDO tee /etc/debsig/policies/AC2D62742012EA22/1password.pol > $OUTPUT
$SUDO mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 > $OUTPUT
curl -sS https://downloads.1password.com/linux/keys/1password.asc | $SUDO gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg > $OUTPUT
echo "[1Password] Installing"
$SUDO apt-get update && $SUDO apt-get install -y 1password 1password-cli > $OUTPUT