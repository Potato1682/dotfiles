#!/usr/bin/sh

if [ -z "$XCURSOR_PATH" ]; then
  export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"
else
  export XCURSOR_PATH="${XCURSOR_PATH}:$XDG_DATA_HOME/icons"
fi

if [ -f "$XDG_CONFIG_HOME/dconf/user" ]; then
  export XCURSOR_SIZE="$(gsettings get org.gnome.desktop.interface cursor-size)" 
  export XCURSOR_THEME="$(gsettings get org.gnome.desktop.interface cursor-theme | sed -E "s/(^'|'\$)//g")" 
fi

