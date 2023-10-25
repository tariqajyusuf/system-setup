#!/bin/bash
# Installs oh-my-zsh (https://ohmyz.sh)
#
# Expects setup/homebrew

brew install zsh git
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"