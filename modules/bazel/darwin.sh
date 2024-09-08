#!/usr/bin/env bash
# Bazel (https://bazel.build)

echo "[Docker] Checking if installed"
if which docker ; then
  exit 0
fi

echo "[Bazel] Installing Bazel"
brew install bazelisk > $OUTPUT