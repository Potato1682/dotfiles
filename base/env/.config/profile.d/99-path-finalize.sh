#!/usr/bin/sh

# remove duplicates of paths
PATH=`printf %s "$PATH" | awk -v RS=: '{ if (!arr[$0]++) { printf("%s%s", !ln++ ? "" : ":", $0) }}'`
export PATH

XCURSOR_PATH=`printf %s "$XCURSOR_PATH" | awk -v RS=: '{ if (!arr[$0]++) { printf("%s%s", !ln++ ? "" : ":", $0) }}'`
export XCURSOR_PATH

