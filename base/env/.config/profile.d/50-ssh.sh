#!/usr/bin/sh

# ssh
unset SSH_AGENT_PID
export SSH_ASKPASS_REQUIRE=prefer

if [ -S "$XDG_RUNTIME_DIR/keyring/ssh" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
  export SSH_ASKPASS="/usr/lib/seahorse/ssh-askpass"
elif systemctl --user is-active gpg-agent-ssh.socket 2>&1 > /dev/null; then
  export SSH_AUTH_SOCK="`systemctl list-sockets --user gpg-agent-ssh.socket | head -n2 | tail -n1 | cut -d' ' -f1`"
elif [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="`gpgconf --list-dirs agent-ssh-socket`"
fi
