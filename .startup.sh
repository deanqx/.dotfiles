#!/bin/bash
sleep 2

signal-desktop &
spotify &
nvidia-settings --load-config-only

while ! pgrep -x "dunst" > /dev/null; do
    sleep 1
done

firefox &
