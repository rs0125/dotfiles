#!/bin/bash

# Check if an image path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/image"
    exit 1
fi

IMAGE="$1"

# Check if file exists
if [ ! -f "$IMAGE" ]; then
    echo "File not found: $IMAGE"
    exit 1
fi

# Set wallpaper with swww
swww img "$IMAGE" --transition-type any --transition-fps 60 --transition-duration 1

# Generate pywal theme
wal -i "$IMAGE"

# Optionally: reload wofi or any apps depending on wal (like waybar, kitty, etc)
# pkill -SIGUSR1 waybar # if waybar is configured for reload
