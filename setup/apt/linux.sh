#!/bin/bash
# Debian handler

echo "[linux] checking if this is debian"
if which apt &> $OUTPUT; then
  echo "[linux][apt] debian found, installing prerequisites."
  apt update &> $OUTPUT
  apt install -y curl sed zip unzip git zsh &> $OUTPUT
  echo "[linux][apt] upgrading packages."
  apt upgrade &> $OUTPUT
fi