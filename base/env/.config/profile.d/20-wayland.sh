#!/usr/bin/sh

if [ -n "$WAYLAND_DISPLAY" ]; then
  export _JAVA_AWT_WM_NONREPARENTING=1

  export SDL_VIDEODRIVER=wayland
  export OBSIDIAN_USE_WAYLAND=1
  export MOZ_ENABLE_WAYLAND=1
  export MOZ_DBUS_REMOTE=1

  export WLR_NO_HARDWARE_CURSORS=1
fi

