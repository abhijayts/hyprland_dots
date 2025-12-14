#!/bin/bash

VOLUME_INFO=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
CURRENT_VOLUME=$(echo "$VOLUME_INFO" | awk '{print int($2 * 100)}')
IS_MUTED=$(echo "$VOLUME_INFO" | grep -q '\[MUTED\]' && echo true || echo false)

# Set max volume to 150%
if [ "$CURRENT_VOLUME" -ge 150 ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1.5
    CURRENT_VOLUME=150
fi

# Select appropriate icon
if [ "$IS_MUTED" = true ] || [ "$CURRENT_VOLUME" -eq 0 ]; then
    LARGE_ICON="audio-volume-muted"
elif [ "$CURRENT_VOLUME" -lt 70 ]; then
    LARGE_ICON="audio-volume-low"
else
    LARGE_ICON="audio-volume-high"
fi

# Use swaync-compatible notification replacement
notify-send "Volume: $CURRENT_VOLUME%" \
    -h string:x-canonical-private-synchronous:volume \
    -h int:value:$CURRENT_VOLUME \
    -i "$LARGE_ICON"
