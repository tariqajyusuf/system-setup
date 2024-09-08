#!/usr/bin/env bash
# Installs oh-my-zsh (https://ohmyz.sh)
#
# Expects curl, git

echo "[oh-my-zsh] Checking if installed"
if [ -d $HOME/.oh-my-zsh ] ; then
  exit 0
fi

echo "[oh-my-zsh] Installing oh-my-zsh..."
bash -c "CHSH=yes $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > $OUTPUT