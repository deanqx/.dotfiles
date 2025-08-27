#!/bin/bash
stow --target ~ .

nvim -c 'PackerSync'

sudo pacman -Sy --needed - < packages_pacman.txt
paru - < packages_aur.txt
