#!/bin/sh
sudo pacman -Sy --needed git base-devel

# Install paru (AUR Helper)
git clone https://aur.archlinux.org/paru.git /tmp/paru
makepkg --syncdeps --install --dir /tmp/paru

source update.sh

# Enable Ly display manager (login screen)
sudo systemctl enable ly

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
