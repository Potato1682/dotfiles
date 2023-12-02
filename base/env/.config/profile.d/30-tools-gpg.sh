#!/usr/bin/sh

export GPG_TTY="$TTY"

#if [ "$WSL2" = 1 ]; then
  #export GPG_AGENT_TARGET_SOCK="$XDG_RUNTIME_DIR/gnupg/d.qwjoyo5i1i5wncx9jpmbnn3p/S.gpg-agent"
  #if ! ss -a | grep -q "$GPG_AGENT_SOCK"; then
    #rm -rf "$GPG_AGENT_SOCK"
    #wsl2_ssh_pageant_bin="$HOME/.ssh/wsl2-ssh-pageant.exe"
    #config_path="C\:/Users/isr/AppData/Local/gnupg"
    #if test -x "$wsl2_ssh_pageant_bin"; then
      #ln -sf "$GPG_AGENT_SOCK" "$GPG_AGENT_TARGET_SOCK"
#
      #(setsid nohup socat UNIX-LISTEN:"$GPG_AGENT_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin -gpgConfigBasepath ${config_path} -gpg S.gpg-agent" >/dev/null 2>&1)
    #else
      #echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
    #fi
    #unset wsl2_ssh_pageant_bin
  #fi
#fi

