#!/usr/bin/sh

# pipenv
export PIPENV_VENV_IN_PROJECT=1

# ccache
if command -v ccache >/dev/null; then
  export USE_CCACHE=1
fi

