#!/bin/bash

# Path to your hyprland.conf file
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

# Check if the config file exists
if [[ ! -f $CONFIG_FILE ]]; then
    echo "Configuration file not found!"
    exit 1
fi

# Read the current value of gaps_out
CURRENT_GAPS_OUT=$(grep -Po '(?<=gaps_out = )\d+' "$CONFIG_FILE")
CURRENT_GAPS_IN=$(grep -Po '(?<=gaps_in = )\d+' "$CONFIG_FILE")
CURRENT_BORDER=$(grep -Po '(?<=border_size = )\d+' "$CONFIG_FILE")
CURRENT_ROUNDING=$(grep -Po '(?<=rounding = )\d+' "$CONFIG_FILE")

# Toggle the value between 8 and 0
if [[ "$CURRENT_GAPS_OUT" == "8" ]]; then
    NEW_GAPS_OUT=0
else
    NEW_GAPS_OUT=8
fi

if [[ "$CURRENT_GAPS_IN" == "3" ]]; then
    NEW_GAPS_IN=0
else
    NEW_GAPS_IN=3
fi

if [[ "$CURRENT_BORDER" == "2" ]]; then
    NEW_BORDER=0
else
    NEW_BORDER=2
fi

if [[ "$CURRENT_ROUNDING" == "10" ]]; then
    NEW_ROUNDING=0
else
    NEW_ROUNDING=10
fi

# Replace the value in the configuration file
sed -i "s/gaps_out = $CURRENT_GAPS_OUT/gaps_out = $NEW_GAPS_OUT/" "$CONFIG_FILE"
sed -i "s/gaps_in = $CURRENT_GAPS_IN/gaps_in = $NEW_GAPS_IN/" "$CONFIG_FILE"
sed -i "s/border_size = $CURRENT_BORDER/border_size = $NEW_BORDER/" "$CONFIG_FILE"
sed -i "s/rounding = $CURRENT_ROUNDING/rounding = $NEW_ROUNDING/" "$CONFIG_FILE"

echo "gaps_out changed to $NEW_GAPS_OUT"

# Optionally, reload Hyprland to apply the changes
hyprctl reload
