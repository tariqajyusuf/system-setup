#!/usr/bin/env bash
# Installs oh-my-zsh (https://ohmyz.sh)
#
# Expects curl, git

echo "[oh-my-zsh] Checking if installed"
if [ -d $HOME/.oh-my-zsh ] ; then
  exit 0
fi

echo "[oh-my-zsh] Installing oh-my-zsh..."
rm -rf /tmp/system-setup/scratch/oh-my-zsh
mkdir -p /tmp/system-setup/scratch/oh-my-zsh
cd /tmp/system-setup/scratch/oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > install.sh
chmod +x install.sh
bash -c "./install.sh --unattended"
echo "[oh-my-zsh] Changing shell to zsh..."
$SUDO chsh -s "$zsh" "$USER"