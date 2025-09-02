#!/usr/bin/env bash
OUTPUT=/dev/null
VERBOSE=false

if [ "`whoami`" != "root" ] ; then
  SUDO=sudo
fi

cd "$(dirname "$0")"

while getopts v flag
do
  case "${flag}" in
    v) VERBOSE=true;;
  esac
done

if $VERBOSE ; then OUTPUT=/dev/fd/1; fi

echo "tariqajyusuf/system-setup"
echo
echo

echo "Checking if repo was downloaded locally"
if ! [ -d ".git" ]; then
  echo "Repo not downloaded, fetching latest"
  rm -rf /tmp/system-setup
  mkdir -p /tmp/system-setup
  curl -L -O https://github.com/tariqajyusuf/system-setup/archive/refs/heads/main.zip > $OUTPUT
  if ! which unzip; then
    if which apt-get; then
      $SUDO apt-get install -y unzip > $OUTPUT
    else
      echo "unzip was not found, please install unzip"
      exit 1
    fi
  fi
  unzip main.zip -d /tmp/system-setup > $OUTPUT
  cd /tmp/system-setup/system-setup-main
fi

export UNAME=`uname | tr '[:upper:]' '[:lower:]'`
echo "Setting up for $UNAME..."

echo "Running setup scripts..."
for setup in `ls setup/*/$UNAME.sh`; do
  bash -c "SUDO=$SUDO OUTPUT=$OUTPUT NONINTERACTIVE=1 $setup"
  if [ $? -ne 0 ]; then
    exit 1
  fi
done

echo "Available Modules:"
for module in `ls modules`; do
  echo " - ${module##*/}"
done

echo
echo "This script by default will install all modules, are there any modules you want to exclude? (comma-separated list, no spaces)"
read EXCLUDE_MODULES

echo "Running module scripts..."
for module in `ls modules`; do
  if [[ ! ",$EXCLUDE_MODULES," =~ ",${module##*/}," ]]; then
    bash -c "SUDO=$SUDO OUTPUT=$OUTPUT NONINTERACTIVE=1 modules/$module/$UNAME.sh"
  else
    echo "Skipping $module"
  fi
done

echo "Applying config preferences..."
for patch in `ls config/*/*.patch`; do
  bash -c "cd ~ && patch -i `pwd`/$patch" > $OUTPUT
done
