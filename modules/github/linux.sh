#!/usr/bin/env bash
# Installs GitHub (https://cli.github.com)

echo "[GitHub CLI] Checking if installed"
if which gh ; then
  exit 0
fi

echo "[GitHub CLI] Installing..."
(type -p wget >/dev/null || ($SUDO apt update && $SUDO apt install wget -y)) \
&& mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& $SUDO apt update \
&& $SUDO apt install gh -y &> $OUTPUT