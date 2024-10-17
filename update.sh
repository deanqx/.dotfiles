stow -t ~/ .

nvim -c 'PackerSync'

sudo pacman -S --needed - < packages-pacman.txt
yay -S --needed - < packages-yay.txt

sudo npm i -g @fsouza/prettierd
