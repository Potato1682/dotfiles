#!/usr/bin/sh

CHROME_EXECUTABLE="`command -v chromium`"

# flutter
if [ -n "$CHROME_EXECUTABLE" ]; then
  export CHROME_EXECUTABLE
fi

