setxkbmap -option caps:escape

i3-msg workspace 10
nvidia-settings &
sleep 2

i3-msg workspace 2
sleep 6

killall nvidia-settings
