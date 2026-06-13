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

# Installation

## 1 Complete the Arch Installation guide

[Arch Installation guide](https://wiki.archlinux.org/title/Installation_guide)

Before continuing installation steps sync your package database:

```zsh
sudo pacman -Sy
```

After you completed the Arch Installation Guide,
clone this repo into your home directory:

```zsh
cd ~
git clone https://github.com/deanqx/.dotfiles
```

## 2 Install recommended packages

```zsh
sudo pacman --needed -S - < ~/.dotfiles/packages_pacman.txt
```

## 3 AUR Package-Manager

Paru is used for this system:

```zsh
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

After installation, you can delete the `paru` folder.

## 4 Enable Services

### 4.1 Pipewire for Audio

```zsh
systemctl enable --now --user pipewire pipewire-pulse wireplumber
```

### 4.2 Ly as Login-Manager

If you are using an Nvidia GPU modify the `Exec`
in `/usr/share/wayland-sessions/sway.desktop` as following:

```ini
Exec=~/.launch_sway_nvidia.sh
```

```zsh
sudo systemctl enable ly@tty1
sudo systemctl disable getty@tty1
```

### 4.3 Enable Time Synchronization

```bash
sudo systemctl enable --now ntpd
```

## 5 Install

```zsh
cd .dotfiles
git pull --recurse-submodules
./install.sh
```

## 7 Optional

### Recommended folder structure for the home directory

- `Areas`: [Johny.Decimal System](https://johnnydecimal.com/documentation/introduction)
- `Inbox`: Downloads
- `Music`
- `Screenshots`
- `Wallpapers`

### Additional Software

```zsh
sudo pacman -S nautilus mpv gwenview gimp vlc
```

`nautilus`: file explorer
`mpv`: high performance video viewer
`gwenview`: image viewer
`gimp`: image editor
`vlc`: versatile video viewer

Install `xdg-terminal-exec` to allow Nautilus executing terminal apps like
Neovim and edit `.config/xdg-terminals.list` accordingly.

```zsh
paru -S xdg-terminal-exec
```

### Apple Emojis

Install Apple looking Emojis from the AUR.

```zsh
paru -S ttf-apple-emoji
```

### Git config

To keep for example `git log` on screen after quitting.

```zsh
git config --global core.pager "less -X"
```

### Terminal-Multiplexer

```zsh
tmux
```

Press `<C-Space>` + `I` to install plugins.

```zsh
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

# Usage

## Switch Audio

This is configured in the [sway config](.config/sway/config).

Press `CMD + Shift + a` to switch audio output device.

## Neovim

### Update packages

[vim.pack](https://neovim.io/doc/user/pack) is used as package manager.

Execute inside Neovim:

```
:lua vim.pack.update()
```

This will download updates from source and show confirmation buffer in a
separate tabpage. Review changes. To confirm all updates execute `:w`.
To discard updates execute `:q`.

### Keep currently open files

After opening Neovim with:

```zsh
vim
```

Use `:Q` to quit and save the session in a `.session.vim` file.
The same command opens the session from current directory.
