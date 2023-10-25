#!/bin/bash
OUTPUT=/dev/null
VERBOSE=false

while getopts v flag
do
  case "${flag}" in
    v) VERBOSE=true;;
  esac
done

if $VERBOSE ; then OUTPUT=/dev/fd/1; fi

echo "tariqajyusuf/system-setup ALPHA build"
echo
echo

echo "Checking if repo was downloaded locally"
if ! [ -d ".git" ]; then
  echo "Repo not downloaded, fetching latest"
  rm -rf /tmp/system-setup
  mkdir -p /tmp/system-setup
  curl -L -O https://github.com/tariqajyusuf/system-setup/archive/refs/heads/main.zip &> $OUTPUT
  if ! which unzip; then
    if which apt; then
      apt install unzip &> $OUTPUT
    else
      echo "unzip was not found, please install unzip"
      exit 1
    fi
  fi
  unzip main.zip -d /tmp/system-setup &> $OUTPUT
  cd /tmp/system-setup/system-setup-main
fi

export UNAME=`uname | tr '[:upper:]' '[:lower:]'`
echo "Setting up for $UNAME..."

echo "Running setup scripts..."
for setup in `ls setup/*/$UNAME.sh`; do
  echo "Installing $setup..."
  sh -c $setup
done

echo "Running module scripts..."
for module in `ls modules/*/$UNAME.sh`; do
  echo "Installing $module..."
  sh -c $module
done

echo "Applying config preferences..."
for patch in `ls config/*/*.patch`; do
  echo "Patching $patch..."
  sh -c "cd ~ && patch -i `pwd`/$patch" &> $OUTPUT
done
