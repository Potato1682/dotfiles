#!/usr/bin/sh

# wsl
if [ "$WSL2" = "1" ]; then
  export WSL_HOST_IP=$(grep -Po '(?<=nameserver ).*' /etc/resolv.conf)
fi

