#!/bin/bash

# ROfi menu

OPTIONS=" Lock\n⏾ Suspend\n󰗽 Logout\n󱄋 Reboot\n⏻ Shutdown\n Cancel"
CHOICE=$(printf '%b\n' "$OPTIONS" | rofi -dmenu -p "System")

case $CHOICE in
    " Lock")
        "$HOME/.config/polybar/scripts/lock.sh"
        ;;
    "⏾ Suspend")
        # swayidle locks the session before logind suspends it.
        systemctl suspend
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
