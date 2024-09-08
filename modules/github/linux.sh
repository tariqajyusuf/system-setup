#!/usr/bin/env bash
# Installs GitHub (https://cli.github.com)

echo "[GitHub CLI] Checking if installed"
if which gh ; then
  exit 0
fi

echo "[GitHub CLI] Installing..."
(type -p wget >/dev/null || ($SUDO apt-get update && $SUDO apt-get install wget -y)) \
&& mkdir -p -m 755 /etc/apt-get/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | $SUDO tee /etc/apt-get/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& $SUDO chmod go+r /etc/apt-get/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt-get/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | $SUDO tee /etc/apt-get/sources.list.d/github-cli.list > /dev/null \
&& $SUDO apt-get update \
&& $SUDO apt-get install gh -y > $OUTPUT