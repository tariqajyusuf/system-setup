#!/bin/bash
# DisplayLink Drivers for Mac (https://www.synaptics.com/products/displaylink-graphics/)

echo "[DisplayLink] Downloading installer..."
rm -rf /tmp/system-setup/scratch/displaylink
mkdir -p /tmp/system-setup/scratch/displaylink
cd /tmp/system-setup/scratch/displaylink
curl -L -o installer.pkg "https://www.synaptics.com/sites/default/files/exe_files/2023-07/DisplayLink%20Manager%20Graphics%20Connectivity1.9-EXE.pkg" &> $OUTPUT
echo "[VSCode] Installing VSCode on your machine, you may get a sudo prompt"
installer -pkg installer.pkg -target / &> $OUTPUT