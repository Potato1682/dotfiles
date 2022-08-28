#!/usr/bin/sh

# qt
export QT_LOGGING_RULES="*.debug=false"
export QT_STYLE_OVERRIDE="kvantum"
export QT_XFT="true"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM="wayland;xcb"
export QT_XCB_GL_INTEGRATION="xcb_egl"
export QT_WAYLAND_CLIENT_BUFFER_INTEGRATION="wayland-egl"
export QT_WAYLAND_DISABLE_WINDOWDECORATION="true"

