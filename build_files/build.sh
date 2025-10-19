#!/bin/bash

set -ouex pipefail

### Install packages

dnf5 swap @gnome-desktop @cinnamon-desktop --exclude=firefox,eom,xfburn,pidgin,xawtv,hexchat,lightdm,thunderbird,gnome-calculator,simple-scan,gnome-terminal,gnome-calendar,transmission,transmission-gtk,yelp -y

dnf5 remove -y gnome-session gdm gnome-shell gnome-tweaks gnome-software gnome-tour evince || true

dnf5 install xorg-x11-server-Xorg lxdm -y

systemctl enable lxdm
systemctl set-default graphical.target
