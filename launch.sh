#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars on all monitors
polybar -l error main_bar -r &

if xrandr --query | grep "DP-0" | grep "connected"; then 
    polybar -l error lenovo_bar -r &
fi

if xrandr --query | grep "DP-1" | grep "connected"; then
    polybar -l error hp_bar -r &
fi
