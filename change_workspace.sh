#!/bin/bash

echo $1
current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
if [[ $1 = "next" ]]; then
    next_workspace=$(( current_workspace + 1 ))
    echo "next"
elif [[ $1 = "prev" ]]; then
    next_workspace=$(( current_workspace - 1 ))
else
    exit 1
fi
i3-msg workspace number $next_workspace
