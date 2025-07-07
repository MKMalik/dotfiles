#!/bin/bash

# Options for your power menu
options="Shutdown\nReboot\nSuspend\nHibernate\nLogout"

# Use wofi (or rofi -dmenu, bemenu, etc.) to present the options
selected_option=$(echo -e "$options" | wofi --dmenu --prompt "Power Actions:")

case "$selected_option" in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
    "Logout")
        # Replace with your Wayland compositor's logout command
        # For Hyprland: hyprctl dispatch exit
        # For Sway: swaymsg exit
        loginctl terminate-session ${XDG_SESSION_ID} # More universal
        ;;
    *)
        # Do nothing if no option is selected or if Esc is pressed
        ;;
esac
