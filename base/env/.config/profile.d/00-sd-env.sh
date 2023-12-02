export $(run-parts /usr/lib/systemd/user-environment-generators | sed '/:$/d; /^$/d' | xargs -d'\n') ENV_LOADED=1

dbus-update-activation-environment --systemd --all

