#!/bin/bash

cp -r i3 ~/.config/i3
cp -r polybar ~/.config/
cp -r i3-alternating-layout ~/
cp -r alacritty ~/.config/
mv .bashrc ~/
mv picom.conf ~/.config/
sudo pacman -S python-pywal python-pip picom feh imagemagick base-devel go i3-gaps i3status xorg xf86-video-intel xorg-xinit
touch .xinitrc && echo "exec i3" >> .xinitrc
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..
yay -S polybar
sudo pip install i3ipc
cp flat2.jpg ~/
wal -i ~/flat2.jpg
sleep 1
echo "reiniciando, faça login e use o comando startx"
sleep 2
reboot
