#!/usr/bin/env bash
# Debian handler

echo "[linux] checking if this is debian"
if which apt-get > $OUTPUT; then
  echo "[linux][apt-get] debian found, installing prerequisites."
  $SUDO apt-get update > $OUTPUT
  $SUDO apt-get install -y curl sed zip unzip git zsh > $OUTPUT
  echo "[linux][apt-get] upgrading packages."
  $SUDO apt-get upgrade -y > $OUTPUT
fi
