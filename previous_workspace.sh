#!/bin/bash

current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
previous_workspace=$((current_workspace-1))
i3-msg workspace number $previous_workspace
