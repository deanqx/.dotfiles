Minimal i3wm installation with Catppuccin color scheme.

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

## 1 Follow Arch Installation guide

[Arch Installation guide](https://wiki.archlinux.org/title/Installation_guide)

Before continuing installation steps sync your package database:

```
# pacman -Sy
```

## 2 Install a window system

You can choose between [i3wm]() ([X11]()) or [sway](https://swaywm.org/) ([Wayland](https://wayland.freedesktop.org/)).

### 2.1 Install desktop fonts

```
# pacman -S noto-fonts ttf-jetbrains-mono-nerd
```

### 2.2 sway installation

```
# pacman -S xorg-xwayland sway
```

## 3 Install basic programs

```
# pacman -S git zsh sudo
```

- `git`
- `zsh`
- `sudo`

## 4 User setup

```
groupadd sudo
```

Uncomment this line in `/etc/sudoers` to allow all users in `sudo` group to have root privileges.

```
%sudo ALL=(ALL:ALL) ALL
```

```
# useradd -m -G sudo -s /usr/bin/zsh your_username
```

- `-m` Create home directory
- `-G` Group
- `-s` Default shell

```
# passwd your_username
# su your_username
```

## 5 Download dotfiles

```
cd ~
git clone https://github.com/deanqx/.dotfiles
```

git pull --recurse-submodules

```
cd .dotfiles
./install.sh
```

TODO install zsh extensions

```
```

## 6 Launching window manager

Reload env or reboot

Depending on your setup execute [sway](https://swaywm.org/) or [i3wm]().

## First Installation

After the Arch Installation following the official guide.

Hint: Close Neovim after plugins are updated.

```
cd ~
git clone git@github.com:deanqx/dotfiles.git .dotfiles
.dotfiles/install.sh
```

### LanguageTool for Neovim

I use LTeX for that. Download the [binaries](https://github.com/valentjn/ltex-ls/releases/download/16.0.0/ltex-ls-16.0.0-linux-x64.tar.gz).

```
tar -xf ~/dload/ltex-ls-16.0.0-linux-x64.tar.gz -C ~/.local/share/nvim/language_servers
```

### Git config

To keep for example `git log` on screen after quitting.

```
git config --global core.pager "less -X"
```

### tmux

```
tmux
```

Press `<C-Space>` + `I` to install plugins.

```
tmux kill-server
```

### Optional programs

```
yay -S spotify discord_arch_electron
```

## Update

Update to new commit of this repo.

Hint: Close Neovim after plugins are updated.

```
./update.sh
```

## Firefox

Add this to `userContent.css` to show background image on Firefox `about:newtab`:

```css
@-moz-document url-prefix(about:newtab) {
    body {
        background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.7)),
            url(Wallpapers/image.JPG) !important;
        background-size: cover !important ;
    }
}
```
