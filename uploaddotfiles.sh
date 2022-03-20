#!/bin/bash

cp /home/zoe/.vim/vimrc /mnt/files/Software/vim/vimrc
cp /home/zoe/.bashrc /mnt/files/Software/bash/.bashrc_arch
cp /home/zoe/.inputrc /mnt/files/Software/bash/.inputrc
crontab -l > /mnt/files/Software/crontab/crontab.lilith
cp /etc/pacman.d/hooks/* /mnt/files/Software/pacman/
cp /home/zoe/bin/* /mnt/files/Software/bin/
cp -r /home/zoe/.config/kitty/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/ranger/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/cava/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/styluslabs/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/barrier/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/rofi/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/polybar/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/i3/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/picom/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/networkmanager-dmenu/ /mnt/files/Software/.config/
cp -r /home/zoe/.config/neofetch/ /mnt/files/Software/.config/
cp /home/zoe/.config/kdenliverc /mnt/files/Software/.config/
cp /home/zoe/.config/kdenlive-layoutsrc /mnt/files/Software/.config/
dconf dump / > /mnt/files/Software/gnome/gnome-settings.ini
sudo cp /root/.bashrc /mnt/files/Software/bash/.bashrc_arch_root
