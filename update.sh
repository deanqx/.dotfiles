stow -t ~/ .

nvim -c 'PackerSync'

sudo pacman -S --needed - < packages-pacman.txt
yay -S --needed - < packages-yay.txt