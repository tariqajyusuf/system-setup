#!/bin/bash
# Installs 1Password (https://1password.com)

echo "[1Password] Adding Deb repository"
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg &> $OUTPUT
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list &> $OUTPUT
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/ &> $OUTPUT
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol &> $OUTPUT
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 &> $OUTPUT
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg &> $OUTPUT
echo "[1Password] Installing"
sudo apt update && sudo apt install 1password 1password-cli &> $OUTPUT