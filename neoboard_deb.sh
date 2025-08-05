#!/usr/bin/env bash
sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/
sudo cp keyboard /etc/default/
sudo cp debstuff/custom /usr/share/X11/xkb/symbols/

