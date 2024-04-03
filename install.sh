#!/usr/bin/env bash
echo "installing Paru"
./getparu.sh
echo "installing nesesary packages"
./pkginstall.sh
echo "enabling firewall"
./firewall.sh
echo "chreating directorys for rice and yt-dlp"
./mkingdir.sh
echo "making Suckless Stuff"
./makesuckless.sh
echo "moving config dotfiles"
./dotfiles.sh
echo "moving keyboard Layout files"
./neoboard.sh
echo "moving setbg"
./backg.sh
echo "moving fastfetch preset"
./fast.sh
echo "making NvChad"
./nvchad.sh


