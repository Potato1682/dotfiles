#!/usr/bin/bash

# Undefine stop/start terminal keybind
if [[ "$SSH_TTY" != "" ]]; then 
  stty stop undef
  stty start undef
fi

