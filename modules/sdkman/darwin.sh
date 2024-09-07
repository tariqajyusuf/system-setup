#!/bin/bash
# Installs SDKMAN! (https://sdkman.io)

echo "[SDKMAN!] Checking if installed"
if which sdk ; then
  exit 0
fi

echo "[SDKMAN!] Installing..."
curl -s "https://get.sdkman.io" | bash &> $OUTPUT