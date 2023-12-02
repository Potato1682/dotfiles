#!/usr/bin/sh

[ -f "$XDG_CONFIG_HOME/locale.conf" ] && . "$XDG_CONFIG_HOME/locale.conf"

case $(tty) in
  (/dev/tty[1-9]) export LANG="en_US.UTF-8";;
              (*) ;;
esac

