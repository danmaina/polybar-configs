#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

dp1=$(xrandr | grep " connected " | awk '{ print$1 }' | grep "DP-1")
dp0=$(xrandr | grep " connected " | awk '{ print$1 }' | grep "DP-0")

# Launch two bars if lenovo and hp screens are connected, otherwise launch the main bar
if [ "$dp1" == "DP-1" ] && [ "$dp0" == "DP-0" ]
then
	polybar -l error lenovo_bar -r &
	polybar -l error hp_bar -r &
else
	polybar -l error main_bar -r &
fi
