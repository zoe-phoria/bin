#!/bin/bash

if [[ -d $HOME/builds/Adwaita-for-Steam/ ]]; then
    cd $HOME/builds/Adwaita-for-Steam/
    git pull
    chmod +x $HOME/builds/Adwaita-for-Steam/install.py
    /usr/bin/python3 $HOME/builds/Adwaita-for-Steam/install.py -e general/no_rounded_window_corners -e library/hide_whats_new
else
    printf "Adwaita-for-Steam not found in $HOME/builds/\n"
    exit 1
fi
