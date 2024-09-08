#!/usr/bin/env bash
# Installs oh-my-zsh (https://ohmyz.sh)
#
# Expects setup/homebrew

echo "[oh-my-zsh] Checking if installed"
if which zsh ; then
  exit 0
fi

echo "[oh-my-zsh] Installing zsh and git from homebrew..."
brew install zsh git > $OUTPUT
echo "[oh-my-zsh] Installing oh-my-zsh..."
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > $OUTPUT