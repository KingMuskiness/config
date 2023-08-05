#!/bin/sh

# GPG
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null

# Disable CTL+S and CTL+Q
stty -ixon

# Change directory with just the directory name
shopt -s autocd 

# Use vim by default
set -o vi
export EDITOR='vim'
export VISUAL='vim'

# Infinite history
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

# Load shortcut and alias file
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
#eval $(dircolors -b $HOME/.dircolors)

# Color tagging by extension
LS_COLORS="di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106"
export LS_COLORS
