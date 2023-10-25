#!/bin/bash
# Installs oh-my-zsh (https://ohmyz.sh)
#
# Expects curl, git

echo "[oh-my-zsh] Installing oh-my-zsh..."
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &> $OUTPUT