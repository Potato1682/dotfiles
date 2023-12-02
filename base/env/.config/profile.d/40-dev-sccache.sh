#!/usr/bin/sh

# sccache
SCCACHE_PATH="`command -v sccache`"

if [ -n "$SCCACHE_PATH" ]; then
  export RUSTC_WRAPPER="$SCCACHE_PATH"
fi

