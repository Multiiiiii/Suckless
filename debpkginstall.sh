
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
xorg
xorg-dev
xserver-xorg-video-all
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
autoconf
gcc
make
pkg-config
libpam0g-dev
libcairo2-dev
libfontconfig1-dev
libxcb-composite0-dev
libev-dev
libxcb-xkb-dev
libxcb-xinerama0-dev
libxcb-randr0-dev
libxcb-image0-dev
libxcb-util0-dev
libxcb-xrm-dev
libxkbcommon-x11-dev
libjpeg-dev
libgif-dev
EOF
)

export PATH=$PATH:/usr/sbin

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fastfetch
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
sudo npm install -g udiskie-dmenu
pipx install pywal
sudo cp ~/.local/bin/wal /usr/bin/
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./build.sh

