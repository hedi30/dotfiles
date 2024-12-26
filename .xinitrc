#!/bin/bash

# Set DPI for eDP1
xrandr --output "eDP1" --dpi 120

# Merge .Xresources if it exists
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# Run xmodmap only if the related files exist
[ -f .Xmodmap ] && xmodmap .Xmodmap
[ -f .ctrl_to_alt ] && xmodmap .ctrl_to_alt
[ -f .pg_dwn_up_to_up ] && xmodmap .pg_dwn_up_to_up

# Start redshift if it's not already running
if ! pgrep -x "redshift" > /dev/null; then
    redshift -c ~/.config/redshift/redshift.conf &
fi

# Run xinput-settings.sh if it exists
[ -f ~/.config/xinput-settings.sh ] && ~/.config/xinput-settings.sh

# Start slstatus if it's not already running
if ! pgrep -x "slstatus" > /dev/null; then
    slstatus &
fi

# Execute dwm if it's not already running
if ! pgrep -x "dwm" > /dev/null; then
    exec dwm
fi


