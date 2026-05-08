#!/usr/bin/env bash

source "$(dirname "$0")/utils.sh"

echo "Setting up shell..."

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# starship
if ! has starship; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true
