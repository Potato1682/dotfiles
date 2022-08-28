#!/bin/bash

if [[ "$CODESPACES" ==  true ]]; then
  if ! command -v stow >/dev/null; then
    PERL_MM_USE_DEFAULT=1 cpan -T Stow > cpan.log 2>&1
  fi

  bash -c 'source ~/.bashrc && cd base && stow -t ~ * > stow.log 2>&1'
fi

exec zsh

