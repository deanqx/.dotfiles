#!/bin/sh
sudo pacman -S --needed git base-devel npm

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -r yay

source update.sh

sudo systemctl enable ly

git submodule update --init --recursive
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
