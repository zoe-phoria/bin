#!/bin/bash

rsync -a -E -v --delete -b --backup-dir=/mnt/SSD1000/DocumentsDeleted/ -P --stats /mnt/files/Documents/ /mnt/SSD1000/DocumentsBackup/
