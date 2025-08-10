#!/bin/sh

BAR_HEIGHT=55  # polybar height
BORDER_SIZE=25  # border size from your wm settings
YAD_WIDTH=350  # 222 is minimum possible value
YAD_HEIGHT=200 # 193 is minimum possible value
SCREEN_CENTER_POSITION=1155
DATE="$(date +"|  %a %d %B %Y %H:%M:%S |")"

case "$1" in
--popup)
    if [ "$(xdotool getwindowfocus getwindowname)" = "yad-calendar" ]; then
        exit 0
    fi

    eval "$(xdotool getmouselocation --shell)"
    eval "$(xdotool getdisplaygeometry --shell)"

    # X
    : $((pos_x = SCREEN_CENTER_POSITION - YAD_WIDTH - BORDER_SIZE))

    # Y
    : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))

    GTK_THEME=Materia-dark yad --calendar --undecorated --fixed --no-buttons --show-weeks --fontname="Liberation Sans Regular 16" \
        --width="$YAD_WIDTH" --height="$YAD_HEIGHT" --posx="$pos_x" --posy="$pos_y" \
        --title="Calender" --borders=0 >/dev/null &
    ;;
*)
    echo "$DATE"
    ;;
esac
