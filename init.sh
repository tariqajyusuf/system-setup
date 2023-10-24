#!/bin/bash

SCRIPT_NAME=system-setup

exec > >(trap "" INT TERM; sed "s/^/[$SCRIPT_NAME] /")
exec 2> >(trap "" INT TERM; sed "s/^/[$SCRIPT_NAME - error] /" >&2)

echo "tariqajyusuf/system-setup ALPHA build"
echo
echo

echo "Checking if repo was downloaded locally"
if ! [ -d ".git" ]; then
  echo "Repo not downloaded, fetching latest"
  mkdir -p /tmp/system-setup
  curl -L -O https://github.com/tariqajyusuf/system-setup/archive/refs/heads/main.zip
  unzip main.zip -d /tmp/system-setup
  cd /tmp/system-setup
fi

export UNAME=`uname | tr '[:upper:]' '[:lower:]'`
echo "Setting up for $UNAME..."

echo "Running setup scripts..."
echo "Running module scripts..."
echo "Applying config preferences..."
