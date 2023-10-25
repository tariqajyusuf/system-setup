#!/bin/bash
# Debian handler

if which apt; then
  apt update
  apt install -y curl sed zip unzip git zsh
fi