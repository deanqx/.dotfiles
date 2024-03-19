## Setup
```
cd ~
git clone git@github.com:deanqx/dotfiles.git .dotfiles
git clone git@github.com:zsh-users/zsh-autosuggestions.git .dotfiles/.oh-my-zsh/plugins/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git .dotfiles/.oh-my-zsh/plugins/zsh-syntax-highlighting
```

## Creating Symlinks
```
sudo apt install stow
cd .dotfiles
stow .
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
mv after after_
:PackerSync
mv after_ after
```

Optional: Bind caps to escape
```
dconf write "/org/gnome/desktop/input-sources/xkb-options" "[ 'caps:escape'"
```
