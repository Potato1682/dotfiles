#!/usr/bin/sh

# common tools
export PAGER=less

if type nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  export VISUAL=nvim

  export SUDO_EDITOR=nvim
fi


# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# less
export LESS="-iMRnsSW -z-4 -x4 --mouse --wheel-lines=3 --incsearch --use-color"
export SYSTEMD_LESS="$LESS"
export SYSTEMD_PAGERSECURE="yes"

