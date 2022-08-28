#!/usr/bin/sh

# input method
if type fcitx >/dev/null 2>&1 || type fcitx5 >/dev/null 2>&1; then
  export GTK_IM_MODULE="fcitx"
  export QT_IM_MODULE="fcitx"
  export XMODIFIERS="@im=fcitx"
  export SDL_IM_MODULE="fcitx"
  export GLFW_IM_MODULE="fcitx"
  export INPUT_METHOD="fcitx"
  export IMSETTINGS_MODULE="fcitx"
  export DefaultIMModule="fcitx"
fi

