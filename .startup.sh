#!/bin/bash
spotify &
discord &
nvidia-settings --load-config-only

while ! pgrep -x "dunst" > /dev/null; do
    sleep 1
done
firefox &

i3-msg workspace 9
