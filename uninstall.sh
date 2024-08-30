#!/bin/bash

if test -f /usr/share/xsessions/dwm.desktop; then
  rm /usr/share/xsessions/dwm.desktop
else
  echo "dwm.desktop not found. Skipping..."
fi 
if test -f /usr/local/bin/dwm.sh; then
  rm /usr/local/bin/dwm.sh
else
  echo "dwm.sh not found. Skipping..."
fi 

cd dwm && sudo make clean uninstall 
cd slstatus && sudo make clean uninstall 
cd dmenu && sudo make clean uninstall
cd st && sudo make clean uninstall


