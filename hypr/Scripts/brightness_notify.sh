#!/bin/bash

BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENT=$((BRIGHTNESS * 100 / MAX_BRIGHTNESS))

# Use swaync-compatible notification replacement
notify-send "Brightness: $PERCENT%" \
    -h string:x-canonical-private-synchronous:brightness \
    -h int:value:$PERCENT \
    -i display-brightness
