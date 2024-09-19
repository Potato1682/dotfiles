if [ -d /usr/lib/systemd/user-environment-generators ]; then
  export $(run-parts /usr/lib/systemd/user-environment-generators | sed '/:$/d; /^$/d' | xargs -d'\n') ENV_LOADED=1
else
  _ENV_LOAD_EVAL="export $(cat "${XDG_CONFIG_HOME:-$HOME/.config}"/environment.d/*.conf | sed '/:$/d; /^$/d' | xargs -d'\n') ENV_LOADED=1"

  eval "$_ENV_LOAD_EVAL"
fi

if command -v dbus-update-activation-environment >/dev/null; then
  dbus-update-activation-environment --systemd --all
fi

