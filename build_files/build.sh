#!/bin/bash

set -ouex pipefail


dnf5 swap @gnome-desktop @cinnamon-desktop --exclude=firefox,eom,xfburn,pidgin,xawtv,hexchat,thunderbird,gnome-calculator,simple-scan,gnome-terminal,gnome-calendar,transmission,transmission-gtk,yelp -y

dnf5 remove -y gnome-session gdm gnome-shell gnome-tweaks gnome-software gnome-tour evince shotwell || true

dnf5 install xorg-x11-server-Xorg kvantum evolution-ews-core cinnamon-calendar-server -y

cp /ctx/system_files/usr/etc/ublue-lightdm-workaround.sh /etc/ublue-lightdm-workaround.sh
cp /ctx/system_files/usr/lib/systemd/system/ublue-lightdm-workaround.service /usr/lib/systemd/system/ublue-lightdm-workaround.service

systemctl enable ublue-lightdm-workaround.service
systemctl enable touchegg


systemctl enable lightdm
systemctl set-default graphical.target
