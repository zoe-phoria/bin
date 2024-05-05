#!/bin/bash

current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
if [[ $1 = "next" ]]; then
    next_workspace=$(( current_workspace + 1 ))
elif [[ $1 = "prev" ]]; then
    next_workspace=$(( current_workspace - 1 ))
else
    exit 1
fi
i3-msg workspace number $next_workspace
