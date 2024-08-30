#!/usr/bin/env bash
sudo cp setbg /usr/bin/ 
sudo cp resizetofullhd /usr/bin/
sudo cp pwoff /usr/bin/
sudo cp screenshot.sh /usr/bin/
cp -r .scripts ~/
systemctl enable betterlockscreen@$USER
