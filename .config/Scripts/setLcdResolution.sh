#!/bin/bash

# Generate mode using cvt
mode=$(cvt 1920 1080 | grep Modeline | cut -d' ' -f2-)

# Add the generated mode
xrandr --newmode $mode

xrandr --addmode VGA-1 "1920x1080_60.00"
# Check if the external monitor is already connected
if xrandr | grep -q "VGA-1 connected"; then
    # External monitor is connected, turn off laptop display and use external monitor only
    xrandr --output LVDS-1 --off --output VGA-1 --mode "1920x1080_60.00"

else
    # External monitor is not connected, turn on laptop display
    xrandr --output LVDS-1 --auto --output VGA-1 --off
fi

