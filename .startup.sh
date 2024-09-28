setxkbmap -option caps:escape

if [ "$(whoami)" = "dean" ]; then
    xrandr --output DP-4 --primary
    xrandr --output DP-4 --right-of DP-0
fi

sleep 9
nvidia-settings &
sleep 1
killall nvidia-settings
