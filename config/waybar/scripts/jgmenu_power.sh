#!/bin/bash

# Function to close jgmenu if it's running
function close_jgmenu {
  pkill -x jgmenu
}

# Close jgmenu if it's already open
close_jgmenu

# Get the current cursor position using hyprctl
pos=$(hyprctl cursorpos)

# Extract X and Y coordinates
X=$(echo $pos | cut -d ' ' -f1)
Y=$(echo $pos | cut -d ' ' -f2)

# Offset Y to place the menu below the power button
Y=$((Y + 30)) # Adjust this offset as needed to align below the button

# Launch jgmenu at the calculated position
jgmenu --geometry=200x400+$X+$Y --csv-file=~/.config/jgmenu/powermenu.csv &
