#!/bin/bash
# Start the server for quicker tmux launch times
tmux start-server

nvidia-settings --load-config-only
playerctld daemon & disown
feh --bg-fill ~/Pictures/wallpapers/bg_*
dunst & disown
picom -b

# Wait two seconds for the display to boot
sleep 2

firefox & disown
signal-desktop & disown
spotify & disown
