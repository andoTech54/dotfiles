#!/bin/bash
choice=$(echo -e "Power Off\nReboot\nLogout" | rofi -dmenu -i -p "Power Menu")
case $choice in
"Power Off") systemctl poweroff ;;
"Reboot") systemctl reboot ;;
"Logout") systemctl restart sddm ;;
esac
