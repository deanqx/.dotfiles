Minimal i3wm installation with Catppuccin colorscheme.

# Features

- Distro: Archlinux
- Works with Nvidia GPU
- Window Manager: i3wm (ly, polybar, rofi, dunst)
- Window System: xorg
- Terminal: Alacritty (transparent)
- Shell: oh-my-zsh
- Editor: Neovim
- tmux
- Spotify (with local music support)

## Switch Audio

This is configured at `.config/i3/config`.

Press `$i3mod+Shift+a` to switch audio output device.

## Neovim

### How to keep currently open files

Use `:Q` to quit and save the session in a `.session.vim` file.

```
vim
```

to open session from current directory.

# Installation

## First Installation

After the Arch Installerlation following the official guide.

Hint: Close Neovim after plugins are updated.

```
cd ~
git clone git@github.com:deanqx/dotfiles.git .dotfiles
.dotfiles/install.sh
```

### tmux

```
tmux
```

Press `<C-Space>` + `I` to install plugins.

```
tmux kill-server
```

## Update

Update to new commit of this repo.

Hint: Close Neovim after plugins are updated.

```
./update.sh
```
