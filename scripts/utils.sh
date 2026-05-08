#!/usr/bin/env bash

set -e

detect_distro() {
    if [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/fedora-release ]; then
        echo "fedora"
    else
        echo "unknown"
    fi
}

install_packages() {
    DISTRO=$(detect_distro)

    if [ "$DISTRO" = "debian" ]; then
        sudo apt update
        sudo apt install -y "$@"

    elif [ "$DISTRO" = "fedora" ]; then
        sudo dnf install -y "$@"

    else
        echo "Unsupported distro"
        exit 1
    fi
}

has() {
    command -v "$1" >/dev/null 2>&1
}
