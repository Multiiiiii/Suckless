#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd

alias ls='ls --color=auto'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias p='sudo pacman'
alias vim='nvim'
alias svim='sudo nvim'
alias noorphans='sudo pacman -R $(pacman -Qtdq)'
alias ytdl='yt-dlp -o "~/Vids/%(title)s.%(ext)s"'
alias ytdlm='yt-dlp -x --audio-format opus --audio-quality 32K -o "/home/m/Music/%(title)s.%(ext)s"'
alias vifm='$HOME/.config/vifm/scripts/vifmrun'
alias gitconf='git config user.name && git config user.email'
alias wttr='curl https://wttr.in/ilmenau'
alias hibernate='swaylock && systemctl hibernate'
alias polkit='/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &'
alias quote='$HOME/.scripts/quote.sh'
source /usr/share/autojump/autojump.bash

export MANPAGER='nvim +Man!'
export PATH="$PATH:$HOME/.scripts"
export HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=500000
 
if [ "$(tty)" = "/dev/tty1" ]; then 
  pgrep -x dwm || exec startx
fi

PS1='[\u@\h][\w]\$ '
fastfetch --load-config default.jsonc

