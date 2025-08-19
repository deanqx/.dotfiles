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

TODO: Cleanup this README

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
tar -xzf ~/Downloads/ltex-ls-16.0.0-linux-x64.tar.gz ~/.local/share/nvim/language_servers
cd ~/.local/share/nvim/language_servers

mv ltex-ls-16.0.0-linux-x64 temp
mv temp/ltex-ls-16.0.0 ltex-ls-16.0.0-linux-x64
rmdir temp
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
