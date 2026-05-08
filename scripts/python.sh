#!/usr/bin/env bash

source "$(dirname "$0")/utils.sh"

echo "Installing 🐍 tooling..."

if ! has uv; then
    curl -Ls https://astral.sh/uv/install.sh | sh
fi
