#!/bin/zsh
source ~/.zshrc

RESULT=true
echo "Verifying Ubuntu image installed successfully..."

echo "Test 1: oh-my-zsh initialization script exists..."
if omz version; then
  echo "Test 1: Passed"
else
  echo "Test 1: Failed"
  RESULT=false
fi

echo "Test 2: SDKMAN! installed correctly..."
if [ -d ~/.sdkman ] ; then
  echo "Test 2: Passed"
else
  echo "Test 2: Failed"
  RESULT=false
fi

echo "Test 3: VSCode installed correctly..."
if code --version --no-sandbox --user-data-dir /tmp; then
  echo "Test 3: Passed"
else
  echo "Test 3: Failed"
  RESULT=false
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