#!/usr/bin/env bash

echo "[darwin] Checkin if homebrew is installed"
if which brew; then
  echo "[darwin] Homebrew is already installed, updating"
  brew update
  exit 0
fi
echo "[darwin] Installing homebrew..."
$SUDO xcodebuild -license accept
if [ $? -ne 0 ]; then
  echo "An error occurred while accepting the Xcode license. Is it installed correctly?"
  exit 1
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > $OUTPUT
echo >> /Users/tariq/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tariq/.zprofile
echo >> /Users/tariq/.bash_profile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tariq/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"
