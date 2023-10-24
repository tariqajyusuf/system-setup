#!/bin/bash
# Installs oh-my-zsh
#
# Expects setup/homebrew

brew install zsh git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"