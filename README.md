dconf write "/org/gnome/desktop/input-sources/xkb-options" "[ 'caps:escape'"
git clone git@github.com:deanqx/dotfiles.git .config

# Neovim
curl -LJO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /usr/local/bin/nvim
sudo ln -s /usr/local/bin/nvim /bin/vim

