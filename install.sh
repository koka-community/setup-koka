#!/bin/bash

echo "Installing Koka packages..."

includes=""
for package in $1; do
  includes="$includes -i$HOME/packages/$package"
  if [ -d ~/packages/$package ]; then
    echo "Package $package already exists, skipping clone."
    continue
  fi 
  echo "Cloning package $package..."
  git clone git@github.com:koka-community/$package.git ~/packages/$package
done
  
echo "Creating Koka alias... $includes"
mkdir -p $HOME/local/bin
echo "$HOME/.kokac/bin/koka $includes \$@" > $HOME/.local/bin/koka
chmod +x $HOME/.local/bin/koka