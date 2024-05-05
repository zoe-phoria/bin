#!/bin/bash

if [[ -f $HOME/bin/dragon ]]; then
    file=$($HOME/bin/dragon --target --print-path --and-exit)
    curl -F "file=@$file" 0x0.st | xclip -selection c
    notify-send "link copied to clipboard"
else
    exit 1
fi
