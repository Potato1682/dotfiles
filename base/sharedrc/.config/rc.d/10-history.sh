#!/usr/bin/bash

# Set where history saved in.
if [[ "$SHELL" =~ "zsh" ]]; then
  HISTFILE="$XDG_STATE_HOME/zsh/history"
elif [[ "$SHELL" =~ "bash" ]]; then
  HISTFILE="$XDG_STATE_HOME/bash/history"
fi

mkdir -p "$(dirname "$HISTFILE")"

# Set history size saved in RAM.
HISTSIZE=10000

# Set history size saved in the file.
SAVEHIST=100000
HISTFILESIZE=100000

