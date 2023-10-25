#!/bin/bash
# Installs oh-my-zsh (https://ohmyz.sh)
#
# Expects setup/homebrew

echo "[oh-my-zsh] Installing zsh and git from homebrew..."
brew install zsh git
echo "[oh-my-zsh] Installing oh-my-zsh..."
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"