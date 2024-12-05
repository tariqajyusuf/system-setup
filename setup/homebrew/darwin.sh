#!/usr/bin/env bash

echo "[darwin] Installing homebrew..."
$SUDO xcodebuild -license accept
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > $OUTPUT
echo >> /Users/tariq/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tariq/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
