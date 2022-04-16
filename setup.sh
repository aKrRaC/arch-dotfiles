#!/bin/bash

echo "#####################################################################################################################################"
echo "                                                       Starting script execution...                                                  "
echo "#####################################################################################################################################"

username=$(id -u -n 1000)
builddir=/home/$username/arch-dotfiles

echo "Performing system update..."
echo " "

#system update
pacman -Syu

echo " "
echo "Installing necessary packages..."
echo " "

#necessary packages
pacman -S unzip picom xorg bspwm polybar lightdm lightdm-slick-greeter rofi kitty thunar flameshot neofetch sxhkd git 
pacman -S papirus-icon-theme nitrogen lxappearance-gtk3 qt5-svg ttf-font-awesome qt5-quickcontrols qt5-quickcontrols2 ttf-fira-code noto-fonts-emoji
yay -S lxpolkit-git

echo " "
echo "Setting up nordic theme..."
echo " "

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

echo " "
echo "Setting up necessary fonts..."
echo " "

# Fira Code Nerd Font variant needed
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts
fc-cache -vf

echo " "
echo "Cloning dotfiles from Github..."
echo " "

git clone https://github.com/aKrRaC/arch-dotfiles.git

echo " "
echo "Setting up config files..."
echo " "

cd builddir
mkdir -p /home/$username/.config
cp .Xresources /home/$username
cp .Xnord /home/$username
cp -R dotfiles/* /home/$username/.config/
mkdir /home/$username/Pictures/Wallpapers
cp background.png /home/$username/Pictures/Wallpapers/
chown -R $username:$username /home/$username
cp 30-touchpad.conf /etc/X11/xorg.conf.d/

echo " "
echo "#####################################################################################################################################"
echo "                                                             All done!                                                               "
echo "                                                    Script executed successfully!                                                    "
echo "                                                Enjoy your new install after a reboot                                                "
echo "#####################################################################################################################################"
echo " "
echo "System rebooting in 5 seconds..."
sleep 5
echo "System rebooting..."

#reboot after setup
reboot
