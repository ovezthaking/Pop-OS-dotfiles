#!/bin/bash

sudo apt update
sudo apt install -y git curl zsh neovim docker.io

# node
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# python tools
pip install uv

# vscode extensions
if [ -f "$HOME/.vscode-extensions.txt" ]; then
  cat ~/.vscode-extensions.txt | xargs -L 1 code --install-extension
fi

chmod +x ~/.local/bin/install.sh
