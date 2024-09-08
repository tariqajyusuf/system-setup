#!/usr/bin/env bash
# Docker Desktop (https://www.docker.com/products/docker-desktop/)

PLATFORM=`uname -m`

echo "[Docker] Checking if installed"
if which docker ; then
  exit 0
fi

echo "[Docker] Detecting linux version"
rm -rf /tmp/system-setup/scratch/docker
mkdir -p /tmp/system-setup/scratch/docker
cd /tmp/system-setup/scratch/docker
if which apt-get; then
  # Pulled from https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
  echo "[Docker][apt-get] Adding Docker apt-get keys"
  $SUDO apt-get install -y ca-certificates curl gnupg > $OUTPUT
  $SUDO install -m 0755 -d /etc/apt-get/keyrings > $OUTPUT
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | $SUDO gpg --dearmor -o /etc/apt-get/keyrings/docker.gpg > $OUTPUT
  $SUDO chmod a+r /etc/apt-get/keyrings/docker.gpg > $OUTPUT

  echo "[Docker][apt-get] Adding repository to apt-get sources"
  echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt-get/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    tee /etc/apt-get/sources.list.d/docker.list > /dev/null
  $SUDO apt-get-get update > $OUTPUT

  echo "[Docker][apt-get] Installing Docker"
  $SUDO apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > $OUTPUT
else
  echo "[Docker] Downloading Docker tarball"
  # TODO: Make this pull latest instead.
  curl -L -o docker.tar.gz "https://download.docker.com/linux/static/stable/$PLATFORM/docker-17.09.0-ce.tgz" > $OUTPUT
  echo "[Docker] Extracting files..."
  tar -xzf docker.tar.gz > $OUTPUT
  echo "[Docker] Installing Docker on your machine, you may get a sudo prompt"
  $SUDO mv docker/* /usr/bin/ > $OUTPUT
fi

echo "[Docker] Installed! Log into Settings Sync to pull your settings."