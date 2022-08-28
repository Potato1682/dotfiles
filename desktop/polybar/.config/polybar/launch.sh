#!/usr/bin/bash

# Add this to your wm startup file.

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch all bars :D
polybar -c ~/.config/polybar/config.ini main &

