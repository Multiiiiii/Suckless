
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
cat
curl
git
qutebrowser
nvim
ncdu
htop
nvtop
vifm
cmake
cmatrix
fonts-font-awesome
nvtop 
mpv
mupdf
syncplay
syncthing
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
pipx
zip
xwallpaper
build-essential 
libx11-dev 
libharfbuzz-dev
libxft-dev 
libxinerama-dev 
libxrandr-dev 
libxkbcommon-dev 
libx11-xcb-dev 
libxcb-util-dev 
libxcb-res0-dev
libxcb-keysyms-dev
EOF
)
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
sudo npm install -g udiskie-dmenu
pipx install pywal
sudo cp ~/.local/bin/wal /usr/bin/

