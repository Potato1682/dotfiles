#!/usr/bin/bash

# General aliases
alias sudo="sudo -v; sudo "

alias mkdir="mkdir -pv"
alias rmdir="rmdir -v"
alias ln="ln -v"

alias g="git"
alias gac="git add . && git commit"
alias gacp="git add . && git commit && git push"

if command -v bat >/dev/null; then
  alias cat="bat"
fi

if command -v delta >/dev/null; then
  alias diff="delta"
fi

alias la="ls -a"
alias ll="ls -lh"
alias l="ll -a"

if command -v eza >/dev/null; then
  alias ls="eza -F --icons --group-directories-first --hyperlink --time-style iso"
  unalias ll
  alias ll="ls -lhgM --smart-group --color-scale"
  alias lr="ll -T"
  alias lx="ll -sextension"
  alias lk="ll -ssize"
  alias lt="ll -smodified"
  alias lc="ll -schanged"
fi

if command -v rg >/dev/null; then
  alias grep="rg --hidden --follow --smart-case 2>/dev/null"
fi

if command -v dmesg >/dev/null; then
  alias dmesg="sudo dmesg -H"
fi

# Shell features
alias so="source"

if command -v systemctl >/dev/null; then
  alias sc="systemctl"
  alias scu="systemctl --user"

  alias jc="journalctl --no-hostname -x"
  alias jcf="jc -f | less"
fi

# noglob
if [[ -n "$ZSH_NAME" ]]; then
  alias sudo="sudo -v; nocorrect sudo "

  if command -v w3m >/dev/null; then
    alias w3m="noglob w3m"
  fi
fi

