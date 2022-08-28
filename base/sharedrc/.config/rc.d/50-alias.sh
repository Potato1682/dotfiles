#!/usr/bin/bash

# General aliases
alias mkdir="mkdir -pv"
alias rmdir="rmdir -v"
alias ln="ln -v"

if command -v bat >/dev/null; then
  alias cat="bat"
fi

if command -v delta >/dev/null; then
  alias diff="delta"
fi

if command -v exa >/dev/null; then
  alias ls="exa -a --icons --group-directories-first"
  alias ll="exa -l --icons --git"
  alias l="ll -a"
  alias lr="ll -T"
  alias lx="ll -sextension"
  alias lk="ll -ssize"
  alias lt="ll -smodified"
  alias lc="ll -schanged"
fi

# Enhanced grep
alias grep="rg --hidden --follow --smart-case 2>/dev/null"

# Shell features
alias so="source"

# Systemd
alias sc="systemctl"
alias scu="systemctl --user"

# noglob
alias w3m="noglob w3m"

