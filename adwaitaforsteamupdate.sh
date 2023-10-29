#!/bin/bash

cd $HOME/builds/Adwaita-for-Steam/
git pull
chmod +x $HOME/builds/Adwaita-for-Steam/install.py
/usr/bin/python3 $HOME/builds/Adwaita-for-Steam/install.py -e general/no_rounded_window_corners -e library/hide_whats_new
