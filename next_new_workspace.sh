#!/bin/bash

current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
next_new_workspace=$((current_workspace+1))
i3-msg workspace number $next_new_workspace
