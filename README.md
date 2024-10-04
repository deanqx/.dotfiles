Distro: Debian 12
Desktop: i3-wm
Windowsystem: X11

## Packages

```
sudo pacman -S --needed - < packages-pacman.txt
sudo yay -S --needed - < packages-yay.txt
```

Enable services:

```
sudo systemctl enable ly
```

## oh-my-zsh

```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Dotfiles

```
cd ~
git clone git@github.com:deanqx/dotfiles.git .dotfiles
cd .dotfiles
stow .
```

## tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
```

Press `<Space-C>` + `I` to install plugins. Close all session to apply plugins.

## Neovim

### Install plugins

Prepare:

```
npm install -g prettier
```

Inside nvim:

```
:PackerSync
```

### How to keep currently open files

Use `:Q` to quit and save the session in a `.session.vim` file.
Use `vim` to open session in current directory.
