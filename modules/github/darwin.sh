#!/bin/bash
# Installs GitHub (https://cli.github.com)

echo "[GitHub CLI] Checking if installed"
if which gh ; then
  exit 0
fi

echo "[GitHub CLI] Installing..."
brew install gh &> $OUTPUT