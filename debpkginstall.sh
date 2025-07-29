
#!/bin/bash

# Update the package list and upgrade installed packages
sudo apt update && sudo apt upgrade -y

# Read the package list
while IFS= read -r package; do
    # Check if the package is available in the official repositories
    if apt-cache show "$package" >/dev/null 2>&1; then
        echo "Installing $package with apt..."
        sudo apt install -y "$package"
    else
        echo "$package is not available in the official repositories."
    fi
done < <(cat <<EOF
autojump
base
base-devel
cmatrix
git
htop
ldns
libxft
libxinerama
linux
linux-firmware
mpv
mpv-mpris
mupdf-gl
neovim
networkmanager
noto-fonts
openssh
pavucontrol
pcmanfm
pipewire
pipewire-pulse
playerctl
pyside6
speedtest-cli
sxiv
transset-df
ttf-arphic-uming
ttf-font-awesome
ttf-jetbrains-mono-nerd
ufw
unclutter
unzip
vifm
xclip
xcompmgr
xdotool
xf86-video-intel
xf86-video-vesa
xorg-bdftopcf
xorg-docs
xorg-font-util
xorg-fonts-100dpi
xorg-fonts-75dpi
xorg-iceauth
xorg-mkfontscale
xorg-server
xorg-server-devel
xorg-server-xephyr
xorg-server-xnest
xorg-server-xvfb
EOF
)

sudo npm install -g udiskie-dmenu
sudo pip3 install pywal

