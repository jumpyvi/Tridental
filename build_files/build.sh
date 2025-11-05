#!/bin/bash

set -ouex pipefail


dnf5 swap @gnome-desktop @cinnamon-desktop --exclude=firefox,eom,xed,mpv,xreader,xfburn,pidgin,xawtv,hexchat,thunderbird,gnome-calculator,simple-scan,gnome-terminal,gnome-calendar,transmission,transmission-gtk,yelp -y

dnf5 remove -y gnome-session gdm gnome-shell nautilus gnome-tweaks gnome-calendar gnome-software gnome-tour evince shotwell || true

dnf5 install xorg-x11-server-Xorg evolution-ews-core cinnamon-calendar-server -y

dnf copr enable kylegospo/webapp-manager -y
dnf5 install --enablerepo=copr:copr.fedorainfracloud.org:kylegospo:webapp-manager webapp-manager -y


cp /ctx/system_files/usr/etc/ublue-lightdm-workaround.sh /etc/ublue-lightdm-workaround.sh
cp /ctx/system_files/usr/lib/systemd/system/ublue-lightdm-workaround.service /usr/lib/systemd/system/ublue-lightdm-workaround.service

systemctl enable ublue-lightdm-workaround.service
systemctl enable touchegg


systemctl enable lightdm
systemctl set-default graphical.target
