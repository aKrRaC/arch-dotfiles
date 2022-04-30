#!/bin/sh

TOGGLE=$HOME/.screen_toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xrandr --output eDP1 --off
else
    rm $TOGGLE
    xrandr --output eDP1 --auto
fi
