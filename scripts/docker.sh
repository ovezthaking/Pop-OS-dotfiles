#!/usr/bin/env bash

source "$(dirname "$0")/utils.sh"

echo "Installing Docker..."

DISTRO=$(detect_distro)

if [ "$DISTRO" = "debian" ]; then
    install_packages docker.io
elif [ "$DISTRO" = "fedora" ]; then
    install_packages docker docker-compose
fi

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker "$USER"
