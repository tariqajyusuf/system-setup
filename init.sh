#!/bin/bash

SCRIPT_NAME=system-setup

exec > >(trap "" INT TERM; sed "s/^/[$SCRIPT_NAME] /")
exec 2> >(trap "" INT TERM; sed "s/^/[$SCRIPT_NAME - error] /" >&2)

echo "tariqajyusuf/system-setup ALPHA build"

echo
echo
export UNAME=`uname | tr '[:upper:]' '[:lower:]'`
echo "Setting up for $UNAME..."

echo "Running setup scripts..."
echo "Running module scripts..."
echo "Applying config preferences..."
