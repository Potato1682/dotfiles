#!/usr/bin/bash

if [[ "$(tty)" =~ /dev/tty[1-6] ]]; then
  export TMOUT=600
fi

