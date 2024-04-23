#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
alias feh='feh --bg-fill'
alias ytdl='yt-dlp -o "~/Vids/%(title)s.%(ext)s"'
alias ytdlm='yt-dlp -x --audio-format opus --audio-quality 32K -o "/home/m/Music/%(title)s.%(ext)s"'
source /usr/share/autojump/autojump.bash

export HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=500000
 

PS1='[\u@\h][\w]\$ '
fastfetch --load-config default.jsonc

