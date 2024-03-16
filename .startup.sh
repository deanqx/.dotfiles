echo "hello" >> test.txt
sleep 9
nvidia-settings &
sleep 1
killall nvidia-settings
