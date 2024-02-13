#!/bin/bash

cvt 1920 1080

xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync

xrandr --addmode VGA-1 "1920x1080_60.00"

xrandr --output LVDS-1 --off --output VGA-1 --mode "1920x1080_60.00"

# turn off screen sleep stuff.
xset s off
xset -dpms

# Background normalize.
nitrogen --restore

# Turn on the laptop's screen.
# xrandr --output LVDS-1 --auto --output VGA-1 --off

