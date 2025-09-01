#!/bin/sh
PARU_TEMP_PATH=/tmp/paru

set -o errexit

stow --target ~ .

sudo pacman -Sy --needed - < packages_pacman.txt

rustup default stable

# Install paru (AUR Helper)
if [ ! -d "$PARU_TEMP_PATH" ]; then
    git clone https://aur.archlinux.org/paru.git "$PARU_TEMP_PATH"
fi

if command -v paru >/dev/null 2>&1; then
    # Update all packages
    paru
else
    makepkg --syncdeps --install --dir "$PARU_TEMP_PATH"
fi

paru - < packages_aur.txt

# Enable Ly display manager (login screen)
sudo systemctl enable ly

# Install Tmux Plugin Manager
if [ ! -d "/home/$USER/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
