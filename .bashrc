# ~/.bashrc
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#
# Bash is not recommended normal use. Please use zsh and ~/.zshrc. 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
