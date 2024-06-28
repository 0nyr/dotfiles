#!/bin/bash

# Load environment variables from .env file
ENV_FILE=~/.config/openvpn/.env
source $ENV_FILE

# Rofi menu
OPTIONS="󰒄 Uni Passau VPN\n󰒄 INSA Lyon VPN\n󰒄 Inria VPN\n Uni Passau Server - deathstar\n Uni Passau Server - drogon\n Cancel"
CHOICE=$(echo -e $OPTIONS | rofi -dmenu -p "System")

# NOTE: Don't forget to add new entry to $OPTIONS variable
case $CHOICE in
    "󰒄 Uni Passau VPN")
        # Connect to Uni Passau VPN
        kitty -e bash -c "sudo openvpn --cd ~/.config/openvpn/ --config ~/.config/openvpn/client/stud-ext.ovpn --auth-nocache --auth-user-pass ~/.config/openvpn/client/pass.txt; echo -e \"Waiting 100s...\"; sleep 100"
        ;;
    "󰒄 INSA Lyon VPN")
        # VPN INSA Lyon
        kitty -e bash -c "source $ENV_FILE; echo -e \"$INSA_LYON_PASSWORD\" | sudo openconnect --protocol anyconnect --user $INSA_LYON_LOGIN --authgroup $INSA_LYON_GROUP --server sslvpn.cisr.fr; echo -e \"Waiting 100s...\"; sleep 100"
        ;;
    "󰒄 Inria VPN")
        # VPN INSA Lyon
        # manual: sudo openconnect --protocol anyconnect --user ***** --server vpn.inria.fr
        kitty -e bash -c "source $ENV_FILE; echo -e \"$INRIA_PASSWORD\" | sudo openconnect --protocol anyconnect --user $INRIA_LOGIN --server vpn.inria.fr; echo -e \"Waiting 100s...\"; sleep 100"
        ;;
    " Uni Passau Server - deathstar")
        # Connect to Uni Passau Server
        kitty -e bash -c "export TERM=xterm-256color; sshpass -p $UNI_PASSAU_SERVER_PASSWORD ssh -t -p $UNI_PASSAU_SERVER_PORT $UNI_PASSAU_USER@$UNI_PASSAU_SERVER; echo -e \"Waiting 100s...\"; sleep 100"
        ;;
    " Uni Passau Server - drogon")
        # Connect to Uni Passau Server
        kitty -e bash -c "export TERM=xterm-256color; sshpass -p $UNI_PASSAU_SERVER_PASSWORD_DROGON ssh -t -p $UNI_PASSAU_SERVER_PORT_DROGON $UNI_PASSAU_USER_DROGON@$UNI_PASSAU_SERVER_DROGON; echo -e \"Waiting 100s...\"; sleep 100"
        ;;
    " Cancel")
        ;;
esac