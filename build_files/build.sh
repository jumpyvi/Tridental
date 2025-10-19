#!/bin/bash

set -ouex pipefail

### Install packages

dnf5 swap @gnome-desktop @cinnamon-desktop --exclude=firefox,eom,xfburn,pidgin,xawtv,hexchat,thunderbird,gnome-calculator,simple-scan,gnome-terminal,gnome-calendar,transmission,transmission-gtk,yelp -y

dnf5 remove -y gnome-session gdm gnome-shell gnome-tweaks gnome-software gnome-tour evince || true

systemctl enable lightdm
systemctl set-default graphical.target
