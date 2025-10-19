#!/bin/bash

set -ouex pipefail

### Install packages

dnf5 swap @gnome-desktop @cinnamon-desktop --exclude=firefox,eom,xfburn,pidgin,xawtv,hexchat,thunderbird,gnome-calculator,simple-scan,gnome-terminal,gnome-calendar,transmission,transmission-gtk,yelp -y

dnf5 remove -y gnome-session gdm gnome-shell gnome-tweaks gnome-software gnome-tour evince || true

dnf5 install xorg-x11-server-Xorg -y

if [ ! -d /var/cache/lightdm ]; then mkdir /var/cache/lightdm; fi
if [ ! -d /var/log/lightdm ]; then mkdir /var/log/lightdm; fi
if [ ! -d /var/lib/lightdm ]; then mkdir /var/lib/lightdm; fi
if [ ! -d /var/lib/lightdm-data ]; then mkdir /var/lib/lightdm-data; fi

getent group lightdm >/dev/null || groupadd -r lightdm
getent passwd lightdm >/dev/null || useradd -g lightdm -M -d /var/lib/lightdm -s /sbin/nologin -r lightdm

systemctl set-default graphical.target
systemctl enable lightdm
systemctl set-default graphical.target
