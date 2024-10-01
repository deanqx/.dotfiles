#!/bin/bash
sleep 1
firefox &
discord &
spotify &

i3-msg workspace 10
nvidia-settings &
sleep 2

i3-msg workspace 1
sleep 6

killall nvidia-settings
