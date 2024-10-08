#!/usr/bin/env bash
# Installs GitHub (https://cli.github.com)

echo "[GitHub CLI] Checking if installed"
if which gh ; then
  exit 0
fi

echo "[GitHub CLI] Installing..."
$SUDO apt-get update > $OUTPUT
$SUDO apt-get install wget -y > $OUTPUT
mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | $SUDO tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > $OUTPUT
$SUDO chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | $SUDO tee /etc/apt/sources.list.d/github-cli.list > $OUTPUT
$SUDO apt-get update > $OUTPUT
$SUDO apt-get install gh -y > $OUTPUT