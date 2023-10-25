#!/bin/bash

RESULT=true
echo "Verifying Ubuntu image installed successfully..."

echo "Test 1: oh-my-zsh initialization script exists..."
if [ -f ~/.oh-my-zsh ] ; then
  echo "Test 1: Passed"
  RESULT=false
else
  echo "Test 1: Failed"
fi

echo "Test 2: SDKMAN! installed correctly..."
if [ -f ~/.sdkman ] ; then
  echo "Test 2: Passed"
  RESULT=false
else
  echo "Test 2: Failed"
fi

echo "Test 3: VSCode installed correctly..."
if code --version --no-sandbox --user-data-dir /tmp; then
  echo "Test 3: Passed"
  RESULT=false
else
  echo "Test 3: Failed"
fi

echo
echo "-----------------------------"
if $RESULT; then
  echo " Result - PASSED"
else
  echo " Result - FAILED"
fi
echo "-----------------------------"
exit `$RESULT`