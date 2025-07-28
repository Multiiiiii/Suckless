
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
curl
git
nvim
htop
nvtop
vifm
cmake
cmatrix
fastfetch
nvtop 
mpv
mupdf
syncplay
yt-dlp
neovim
udiskie
unzip
warp
nodejs 
npm
xclip
xdotool
ufw
python3 
python3-pip
zip
xwallpaper
build-essential 
libx11-dev 
libxft-dev 
libxinerama-dev 
libxrandr-dev 
libxkbcommon-dev 
libx11-xcb-dev 
libxcb-util-dev 
libxcb-keysyms-dev
EOF
)

sudo npm install -g udiskie-dmenu
sudo pip3 install pywal

