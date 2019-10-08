#!/usr/bin/env bash

# Copyright © 2018 Ivan Vandot <ivan@vandot.rs>
# All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

if command -v curl >/dev/null 2>&1; then
  curl -s https://raw.githubusercontent.com/vandot/awstoken/master/.awstoken -o "$HOME"/.awstoken
elif command -v wget >/dev/null 2>&1; then
  wget -q https://raw.githubusercontent.com/vandot/awstoken/master/.awstoken -o "$HOME"/.awstoken
else
  echo "Download into $HOME folder https://raw.githubusercontent.com/vandot/awstoken/master/.awstoken"
  echo "source .awstoken into your bash/zsh/ksh env . ~/.awstoken"
  exit 0
fi

if test -n "$ZSH_VERSION"; then
  rcfile=".zshrc"
elif test -n "$BASH_VERSION"; then
  if [[ $(uname -s) = "Darwin" ]]; then
    rcfile=".bash_profile"
  else
    rcfile=".bashrc"
fi
elif test -n "$KSH_VERSION"; then
  rcfile=".kshrc"
elif test -n "$FCEDIT"; then
  rcfile=".kshrc"
else
  echo "Unknown shell, source ~/.awstoken into your shell env manually"
  exit 1
fi

echo ". $HOME/.awstoken" >> ~/$rcfile
printf "awstoken installed...\\nto be able to use it current shell source it with\\n. ~/.awstoken\\n\\n"
