sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.txt))
cd dwm && sudo make clean install
cd ..
cd slstatus && sudo make clean install
cd ..
cd st && sudo make clean install
mv .xinitrc ~/ 
mv .bashrc ~/ 
sudo mv 00-keyboard.conf /etc/X11/xorg.conf.d/
sudo mv vconsole.conf /etc/
sudo mv setbg /usr/bin/ 
sudo mv default.jsonc /usr/share/fastfetch/presets/
systemctl enable ufw
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin && makepkg -sri
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
