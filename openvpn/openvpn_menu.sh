#!/bin/bash

# Load environment variables from .env file
source ~/.config/openvpn/.env

# Rofi menu
OPTIONS="󰒄 Uni Passau VPN\n Cancel"
CHOICE=$(echo -e $OPTIONS | rofi -dmenu -p "System")

case $CHOICE in
    "󰒄 Uni Passau VPN")
        # Connect to Uni Passau VPN
        kitty -e bash -c "sudo openvpn --cd ~/.config/openvpn/ --config ~/.config/openvpn/client/stud-ext.ovpn --auth-nocache --auth-user-pass ~/.config/openvpn/client/pass.txt; echo -e \"Waiting 100s...\"; sleep 100"
        ;;
    " Cancel")
        ;;
esac