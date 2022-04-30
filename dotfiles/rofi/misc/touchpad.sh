#!/bin/sh

TOGGLE=$HOME/.touchpad_toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xinput disable "ELAN1300:00 04F3:3057 Touchpad"
    notify-send -u low -i touchpad "Touchpad disabled"
else
    rm $TOGGLE
    xinput enable "ELAN1300:00 04F3:3057 Touchpad"
    notify-send -u low -i touchpad "Touchpad enabled"
fi
