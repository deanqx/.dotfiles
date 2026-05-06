 My Linux configuration files for desktop.

# Features

- Distro: Archlinux
- Desktop: sway (Wayland)
- Shell: zsh
- Editor: Neovim
- Terminal: foot with tmux

## Preview

![Preview](preview.png)
Sep 11, 2025

## Switch Audio

This is configured in the [sway config](.config/sway/config).

Press `CMD + Shift + a` to switch audio output device.

## Neovim

### Keep currently open files

After opening Neovim with:

```
vim
```

Use `:Q` to quit and save the session in a `.session.vim` file.
The same command opens the session from current directory.

# Installation

## 1 Complete the Arch Installation guide

[Arch Installation guide](https://wiki.archlinux.org/title/Installation_guide)

Before continuing installation steps sync your package database:

```
sudo pacman -Sy
```

After you completed the Arch Installation Guide,
clone this repo into your home directory:

```
cd ~
git clone https://github.com/deanqx/.dotfiles
```

## 2 Install recommended packages

```
sudo pacman --needed -S - < ~/.dotfiles/packages_pacman.txt
```

## 3 AUR Package-Manager

Paru is used for this system:

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

After installation you can delete the `paru` folder.

## 4 Enable Services

### 4.1 Pipewire for Audio

```
systemctl enable --now --user pipewire pipewire-pulse wireplumber
```

### 4.2 Ly as Login-Manager

If you are using an Nvidia GPU modify the `Exec`
in `/usr/share/wayland-sessions/sway.desktop` as following:

```
Exec=~/.launch_sway_nvidia.sh
```

```
sudo systemctl enable ly@tty1
sudo systemctl disable getty@tty1
```

## 5 Install

```
cd .dotfiles
git pull --recurse-submodules
./install.sh
```

## 7 Optional

### Recommended folder structure of home directory

1. `archive`: Old projects or general obsolete things. The home structure could be copied here.
2. `inbox`: Downloads
3. `projects`: Files that are finished at one point.
4. `screenshots`: Location of screenshots
5. `sectors`: Long-lived files like wallpapers or music.
6. `templates`: Resources to be reused else where.

### Additional Software

```
sudo pacman -S nautilus mpv gwenview gimp vlc
```

`nautilus`: file explorer
`mpv`: high performance video viewer
`gwenview`: image viewer
`gimp`: image editor
`vlc`: versatile video viewer

### Apple Emojis

Install Apple looking Emojis from the AUR.

```
paru -S ttf-apple-emoji
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

### Firefox custom background

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
