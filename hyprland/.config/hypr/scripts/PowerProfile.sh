#!/bin/bash

# Get the current power profile
current_profile=$(powerprofilesctl get)

# Define the profiles
profiles=("performance" "balanced" "power-saver")

# Create an array for the options
options=()

# Populate the options array based on the current profile
for profile in "${profiles[@]}"; do
    if [[ "$profile" == "$current_profile" ]]; then
        options+=("$profile (current)")
    else
        options+=("$profile")
    fi
done

# Use rofi to display the options
selected=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Select Power Profile")

# Change the profile based on the selection
case $selected in
    *"performance"*)
        powerprofilesctl set performance
        ;;
    *"balanced"*)
        powerprofilesctl set balanced
        ;;
    *"power-saver"*)
        powerprofilesctl set power-saver
        ;;
esac
