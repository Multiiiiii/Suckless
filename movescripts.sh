#!/usr/bin/env bash
sudo mv setbg /usr/bin/ 
sudo mv resizetofullhd /usr/bin/
sudo mv pwoff /usr/bin/
sudo mv screenshot.sh /usr/bin/
mv -r .scripts ~/
systemctl enable betterlockscreen@$USER
