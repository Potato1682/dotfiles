#!/bin/bash

if [[ "$CODESPACES" ==  true ]]; then
  if ! command -v stow >/dev/null; then
    PERL_MM_USE_DEFAULT=1 cpan -T Stow > cpan.log 2>&1
  fi

  if [ -z "$XDG_DATA_HOME" ]; then
    mkdir -p "$HOME"/.local/share
  fi

  if [ -z "$XDG_STATE_HOME" ]; then
    mkdir -p "$HOME"/.local/state
  fi

  if [ -z "$XDG_CONFIG_HOME" ]; then
    mkdir -p "$HOME"/.config
  fi

  bash -c 'source ~/.bashrc && cd base && stow -t ~ * > stow.log 2>&1'
fi

exec zsh

