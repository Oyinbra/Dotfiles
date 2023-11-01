#!/bin/bash

######################################################################################################################

sudo pacman -S wget --noconfirm --needed

echo "Getting the ArcoLinux keys from the ArcoLinux repo"

sudo wget https://github.com/arcolinux/arcolinux_repo/raw/main/x86_64/arcolinux-keyring-20251209-3-any.pkg.tar.zst -O /tmp/arcolinux-keyring-20251209-3-any.pkg.tar.zst
sudo pacman -U --noconfirm --needed /tmp/arcolinux-keyring-20251209-3-any.pkg.tar.zst

######################################################################################################################

echo "Getting the latest arcolinux mirrors file"

sudo wget https://github.com/arcolinux/arcolinux_repo/raw/main/x86_64/arcolinux-mirrorlist-git-23.06-01-any.pkg.tar.zst -O /tmp/arcolinux-mirrorlist-git-23.06-01-any.pkg.tar.zst
sudo pacman -U --noconfirm --needed /tmp/arcolinux-mirrorlist-git-23.06-01-any.pkg.tar.zst

# Create backup for pacman.conf
sudo cp /etc/pacman.conf /etc/pacman.bak

echo '
#[arcolinux_repo_testing]
#SigLevel = Optional TrustedOnly
#Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo]
SigLevel = Optional TrustedOnly
Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo_3party]
SigLevel = Optional TrustedOnly
Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo_xlarge]
SigLevel = Optional TrustedOnly
Include = /etc/pacman.d/arcolinux-mirrorlist' | sudo tee --append /etc/pacman.conf

sudo pacman -Sy archlinux-tweak-tool-git --noconfirm --needed
######################################################################################################################
echo '
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee --append /etc/pacman.conf
sudo pacman -Sy
