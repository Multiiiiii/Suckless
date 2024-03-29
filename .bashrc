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

export HISTCONTROL=ignoreboth

PS1='[\u@\h][\w]\$ '
fastfetch --load-config default.jsonc

