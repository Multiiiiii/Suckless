echo "installing Paru"
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin && makepkg -sri
cd ~
echo "installing nesesary packages"
./pkginstall.sh
echo "enabling firewall"
systemctl enable ufw
echo "making dwm"
cd dwm && sudo make clean install
cd ..
echo "making slstatus"
cd slstatus && sudo make clean install
cd ..
echo "making st"
cd st && sudo make clean install
echo "chreating directorys for rice and yt-dlp"
mkdir Pictures
mkdir Vids
cd Pictures
mkdir Wall
cd .. 
echo "moving config dotfiles"
mv .xinitrc ~/ 
mv .bashrc ~/ 
echo "moving keyboard Layout files"
sudo mv 00-keyboard.conf /etc/X11/xorg.conf.d/
sudo mv vconsole.conf /etc/
echo "moving setbg"
sudo mv setbg /usr/bin/ 
echo "moving fastfetch preset"
sudo mv default.jsonc /usr/share/fastfetch/presets/
echo "making NvChad"
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
