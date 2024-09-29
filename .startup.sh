setxkbmap -option caps:escape
xset r rate 250 35

i3-msg workspace 10
nvidia-settings &
sleep 2

i3-msg workspace 1
sleep 6

killall nvidia-settings
