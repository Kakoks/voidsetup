#!/usr/bin/bash
#install void repos
sudo xbps-install -Su void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree void-repo-debug -y &&

#install amd gpu drivers, opengl, vulkan and video acceletarion
sudo xbps-install linux-firmware-amd mesa-dri vulkan-loader mesa-vulkan-radeon amdvlk xf86-video-amdgpu mesa-vaapi mesa-vdpau -y &&

#audio setup (pulseaudio)
sudo xbps-install alsa-utils apulse alsa-plugins-pulseaudio -y &&

#Network setup (ethernet only)
sudo xbps-install NetworkManager ufw gufw -y && sudo ln -s /etc/sv/NetworkManager /var/service && sudo ln -s /etc/sv/ufw /var/service &&

#install general utils
sudo xbps-install xtools git neofetch htop nano iftop nethogs xterm -y && 

#core components
sudo xbps-install dbus -y && sudo ln -s /etc/sv/dbus /var/service &&

#Desktop Environment (choose by deleting the #)
#sudo xbps-install gnome gnome-tweaks -y &&
#sudo xbps-install kde5 kd5-baseapps kdegraphics-thumbnailers -y &&
#sudo xbps-install mate -y &&
#sudo xbps-install lxqt lxqt-qtplugin -y &&
#sudo xbps-install lxde -y && 

#Display server 
sudo xbps-install xorg -y &&

#Fonts installation and config (if you don't want any of the fonts you can just remove the ones you don't want.)
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/ &&
sudo xbps-reconfigure -f fontconfig &&
sudo xbps-install dejavu-fonts-ttf google-fonts-ttf liberation-fonts-ttf nerd-fonts-ttf noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-emoji ttf-opensans -y &&

#General apps i use 
sudo xbps-install deja-dup libreoffice-calc libreoffice-writer firefox okular geary chromium virtualbox-ose virtualbox-ose-dkms obs gedit gnome-disks gnome-system-monitor -y && 

#install Steam and necessary deps
sudo xbps-install steam libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit -y && 

#Display Manager (choose)
sudo xbps-install gdm -y &&
#sudo xbps-install sddm -y &&

#install Ms fonts
#git clone https://github.com/void-linux/void-packages.git &&
#cd void-packages &&
#./xbps-src binary-bootstrap &&
#echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf &&
#./xbps-src pkg msttcorefonts -y &&

sudo reboot 
