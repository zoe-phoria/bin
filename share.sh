#!/bin/bash

# upload file to 0x0.st (alternative: x0.at) with fzf selection
cwd=$(pwd)
file=$(find $cwd -type f | fzf)

if [[ $OSTYPE == "linux-gnu" && -f /usr/bin/xclip ]]; then
    curl -F "file=@$file" 0x0.st | xclip -selection c
elif [[ $OSTYPE == "darwin"* ]]; then
    curl -F "file=@$file" 0x0.st | pbcopy
else
    curl -F "file=@$file" 0x0.st
fi

notify-send "link copied to clipboard"
