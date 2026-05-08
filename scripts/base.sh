#!/usr/bin/env bash

source "$(dirname "$0")/utils.sh"

echo "Installing base packages..."

DISTRO=$(detect_distro)

if [ "$DISTRO" = "debian" ]; then
    install_packages \
        git \
        curl \
        wget \
        unzip \
        fzf \
        zoxide \
        neovim \
        zsh \
        build-essential

elif [ "$DISTRO" = "fedora" ]; then
    install_packages \
        git \
        curl \
        wget \
        unzip \
        fzf \
        zoxide \
        neovim \
        zsh \
        gcc \
        gcc-c++ \
        make
fi
