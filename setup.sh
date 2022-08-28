#!/bin/bash

if [[ "$CODESPACES" ==  true ]]; then
  if ! command -v stow >/dev/null; then
    PERL_MM_USE_DEFAULT=1 cpan -T Stow
  fi

  bash -c 'source ~/.bashrc && rm -f ~/.bashrc ~/.zshrc && cd base && stow -t ~ *'
fi

exec zsh

