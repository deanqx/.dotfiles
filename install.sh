#!/bin/sh
stow --target ~ .

sudo pacman -Sy --needed - < packages_pacman.txt

# Install paru (AUR Helper)
git clone https://aur.archlinux.org/paru.git /tmp/paru
makepkg --syncdeps --install --dir /tmp/paru

paru - < packages_aur.txt

# Enable Ly display manager (login screen)
sudo systemctl enable ly

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
