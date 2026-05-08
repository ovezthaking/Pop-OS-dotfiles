#!/usr/bin/env bash

echo "Installing VSCode extensions..."

if [ -f "$HOME/.vscode-extensions.txt" ]; then
    cat "$HOME/.vscode-extensions.txt" | xargs -L 1 code --install-extension
fi
