#!/usr/local/bin/bash

if [[ -f /Volumes/files/passwords.kdbx ]]; then
    rsync -a -E -v --delete -b --backup-dir=/Users/zoe/DocumentsDeleted/ -P --stats /Volumes/files/Documents/ /Users/zoe/DocumentsBackup/
    rm /Users/zoe/.sync.err
else
    printf "$(date +"%Y-%m-%d_%H-%M"): ds718p not connected; syncDocs unsuccessful\n" >> /Users/zoe/.sync.err
fi
