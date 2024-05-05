#!/bin/bash

current_workspace=$(i3-msg -t get_workspaces | awk -F '\"focused\":true' '{print $1}' | awk -F '\"name\"' '{print $NF}' | awk -F '\"' '{print $2}')
if [[ $1 = "next" ]]; then
    next_workspace=$(( current_workspace + 1 ))
elif [[ $1 = "prev" ]]; then
    if (( $current_workspace > 1 )); then
        next_workspace=$(( current_workspace - 1 ))
    else
        paplay /usr/share/sounds/freedesktop/stereo/bell.oga
    fi
else
    exit 1
fi
i3-msg workspace number $next_workspace
