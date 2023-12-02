#!/usr/bin/sh

[ -f "$XDG_CONFIG_HOME/user-dirs.dirs" ] && . "$XDG_CONFIG_HOME/user-dirs.dirs"

# Create directories
if [ -d "${XDG_CONFIG_HOME:-~/.config}" -o -d "${XDG_DATA_HOME:-~/.local/share}" -o -d "${XDG_STATE_HOME:-~/.local/state}" ]; then
  mkdir -p "${XDG_STATE_HOME:-~/.local/state}/fzf" # Used internally
  mkdir -p "${XDG_CONFIG_HOME:-~/.config}/postgres"
  mkdir -p "${XDG_STATE_HOME:-~/.local/state}/pulse"
  mkdir -p "${XDG_DATA_HOME:-~/.local/share}/wineprefixes"
  mkdir -p "${XDG_STATE_HOME:-~/.local/state}/wget"
  mkdir -p "${XDG_STATE_HOME:-~/.local/state}/sqlite"
  mkdir -p "${XDG_CONFIG_HOME:-~/.config}/wakatime"
fi

