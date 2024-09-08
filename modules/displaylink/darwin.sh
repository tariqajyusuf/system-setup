#!/usr/bin/env bash
# DisplayLink Drivers for Mac (https://www.synapt-getics.com/products/displaylink-graphics/)

echo "[DisplayLink] Downloading installer..."
rm -rf /tmp/system-setup/scratch/displaylink
mkdir -p /tmp/system-setup/scratch/displaylink
cd /tmp/system-setup/scratch/displaylink
curl -L -o installer.pkg "https://www.synapt-getics.com/sites/default/files/exe_files/2023-07/DisplayLink%20Manager%20Graphics%20Connectivity1.9-EXE.pkg" > $OUTPUT
echo "[DisplayLink] Installing DisplayLink on your machine, you may get a sudo prompt"
$SUDO installer -pkg installer.pkg -target / > $OUTPUT