#!/bin/bash

# ROfi menu

OPTIONS=" Lock\n󰗽 Logout\n󱄋 Reboot\n⏻ Shutdown\n Cancel"
CHOICE=$(echo -e $OPTIONS | rofi -dmenu -p "System")

case $CHOICE in
    " Lock")
        # lock i3 session (keep )
        $HOME/.config/polybar/scripts/lock.sh
        ;;
    "󰗽 Logout")
        # thunderbird doexn't exit properly at logout
        # so we kill it manually
        pkill thunderbird ; i3-msg exit
        ;;
    "󱄋 Reboot")
        systemctl reboot
        ;;
    "⏻ Shutdown")
        systemctl poweroff
        ;;
    " Cancel")
        
        ;;
esac