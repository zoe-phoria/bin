#!/bin/bash

SOURCE=/mnt/music
TARGET=/mnt/backup_music
BACKUP=/mnt/backup_music

# archive mode, verbose, backup mode, show progress, delete after completion, exclude #recycle
rsync -avb --progress --delete-after --backup-dir=$BACKUP --exclude '#recycle' $SOURCE $TARGET >> "/mnt/backup_music/rsync_log_$(date)"
