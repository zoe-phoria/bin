#!/usr/local/bin/bash

if [[ -f /Volumes/files/passwords.kdbx ]]; then
    cp -v /Volumes/files/passwords.kdbx /Users/zoe/passwords.kdbx
    rm /Users/zoe/.sync.err
else
    printf "$(date +"%Y-%m-%d_%H-%M"): ds718p not connected; syncPass unsuccessful\n" >> /Users/zoe/.sync.err
fi
