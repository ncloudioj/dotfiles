#!/bin/sh

selected=$(echo "Shutdown
Reboot
Log Out
Lock
Suspend" | rofi -dmenu -location 1 -yoffset 0 -width 300 -xoffset 0)

if [ "$selected" == "Shutdown" ]; then
    shutdown now
elif [ "$selected" == "Reboot" ]; then
    reboot
elif [ "$selected" == "Log Out" ]; then
    i3-msg exit
elif [ "$selected" == "Lock" ]; then
    betterlockscreen -w blur
elif [ "$selected" == "Suspend" ]; then
    systemctl suspend
else
    echo "nothing"
fi
