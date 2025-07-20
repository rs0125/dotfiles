#!/bin/bash

# Get list of active workspaces (those with at least one window)
workspaces=$(hyprctl workspaces -j | jq '[.[] | select(.windows > 0)]')

# Get current workspace ID
current=$(hyprctl activeworkspace -j | jq '.id')

# Extract just the workspace IDs
ids=($(echo "$workspaces" | jq '.[].id'))

# Find index of current in the active list
for i in "${!ids[@]}"; do
    if [[ "${ids[$i]}" == "$current" ]]; then
        index=$i
        break
    fi
done

# Compute next index (wrap around)
next_index=$(( (index + 1) % ${#ids[@]} ))
next_id=${ids[$next_index]}

# Switch to the next active workspace
hyprctl dispatch workspace "$next_id"
