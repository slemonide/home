#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Enable transparency (0<transparency<1)
#transset-df -a 0.8 &> /dev/null
