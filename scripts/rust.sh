#!/usr/bin/env bash

source "$(dirname "$0")/utils.sh"

echo "Installing 🦀..."

if ! has cargo; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
fi
