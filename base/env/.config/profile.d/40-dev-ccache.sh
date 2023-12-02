#!/usr/bin/sh

# ccache
if command -v ccache >/dev/null; then
  export USE_CCACHE=1
fi

