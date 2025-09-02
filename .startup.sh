#!/bin/bash
# Start the server for quicker tmux launch times
tmux start-server

if [ $USER == "deanqx" ]; then
    nvidia-settings --load-config-only
fi

# Wait two seconds for the display to boot
sleep 2

firefox & disown
signal-desktop & disown

if [ $USER == "deanqx" ]; then
    spotify & disown
fi
