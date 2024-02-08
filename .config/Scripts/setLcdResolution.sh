#!/bin/bash

mode=$(cvt 1920 1080 | grep Modeline | cut -d' ' -f2-)

xrandr --newmode $mode

xrandr --addmode VGA-1 "1920x1080_60.00"

xrandr --output LVDS-1 --off --output VGA-1 --mode "1920x1080_60.00"

# xrandr --output LVDS-1 --auto --output VGA-1 --off

