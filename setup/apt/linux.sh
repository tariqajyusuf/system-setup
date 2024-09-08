#!/usr/bin/env bash
# Debian handler

echo "[linux] checking if this is debian"
if which apt > $OUTPUT; then
  echo "[linux][apt] debian found, installing prerequisites."
  $SUDO apt update > $OUTPUT
  $SUDO apt install -y curl sed zip unzip git zsh > $OUTPUT
  echo "[linux][apt] upgrading packages."
  $SUDO apt upgrade -y > $OUTPUT
fi
