#!/bin/bash

# upload file to 0x0.st (alternative: x0.at) with fzf selection
cwd=$(pwd)
file=$(find $cwd -type f | fzf)
curl -F "file=@$file" 0x0.st | xclip -selection c
notify-send "link copied to clipboard"
