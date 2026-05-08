#!/usr/bin/env bash

source "$(dirname "$0")/utils.sh"

echo "Installing mise + Node.js..."

if ! has mise; then
    curl https://mise.run | sh
fi

export PATH="$HOME/.local/bin:$PATH"

mise use -g node@lts
