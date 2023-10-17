#!/usr/bin/sh

# pipenv
export PIPENV_VENV_IN_PROJECT=1

# ccache
if command -v ccache >/dev/null; then
  export USE_CCACHE=1
fi

# android
if [ -d "/opt/android-sdk" ]; then
  export ANDROID_SDK_ROOT="/opt/android-sdk"

  export PATH="$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin"
fi

# python
[ -f "$RYE_HOME/env" ] && . "$RYE_HOME/env"

