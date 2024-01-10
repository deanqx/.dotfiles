```
git clone git@github.com:deanqx/dotfiles.git .config
```

Optional: Bind caps to escape
```
dconf write "/org/gnome/desktop/input-sources/xkb-options" "[ 'caps:escape'"
```

## Neovim
```
curl -LJO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
rm nvim.appimage
sudo mv squashfs-root /usr/bin/nvim
sudo ln -s /usr/bin/nvim/AppRun /usr/bin/nvim
sudo ln -s /usr/bin/nvim/AppRun /usr/bin/vim
sudo ln -s /usr/bin/nvim/nvim.desktop /usr/share/applications
```
```
cd ~/.config
git clone --depth 1 https://github.com/wbthomason/packer.nvim
```
