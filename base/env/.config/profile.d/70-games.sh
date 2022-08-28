#!/usr/bin/sh

# wine
export WINEESYNC=1
export WINEFSYNC=1
export WINEFSYNC_FUTEX2=1

# wine staging
export STAGING_SHARED_MEMORY=1
export STAGING_WRITECOPY=1

# steam proton
export PROTON_USE_SECCOMP=1

