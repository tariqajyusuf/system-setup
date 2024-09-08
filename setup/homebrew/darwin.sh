#!/usr/bin/env bash

echo "[darwin] Installing homebrew..."
$SUDO xcodebuild -license accept
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > $OUTPUT
(echo; echo 'eval "$(/ops/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
