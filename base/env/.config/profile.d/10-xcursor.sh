#!/usr/bin/sh

if [ -f "$XDG_CONFIG_HOME/dconf/user" ]; then
  export XCURSOR_SIZE="$(gsettings get org.gnome.desktop.interface cursor-size)" 
  export XCURSOR_THEME="$(gsettings get org.gnome.desktop.interface cursor-theme | sed -E "s/(^'|'\$)//g")" 
fi

