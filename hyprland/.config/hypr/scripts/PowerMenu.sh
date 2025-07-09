#!/bin/bash

# Options for your power menu
options="shutdown\nreboot\nsuspend\nhibernate\nlogout"

selected_option=$(echo -e "$options" | rofi -dmenu -p "Power Actions")

case "$selected_option" in
    "shutdown")
        systemctl poweroff
        ;;
    "reboot")
        systemctl reboot
        ;;
    "suspend")
        systemctl suspend
        ;;
    "hibernate")
        systemctl hibernate
        ;;
    "logout")
        # Replace with your Wayland compositor's logout command
        # For Hyprland: hyprctl dispatch exit
        # For Sway: swaymsg exit
        loginctl terminate-session ${XDG_SESSION_ID} # More universal
        ;;
    *)
        # Do nothing if no option is selected or if Esc is pressed
        ;;
esac
