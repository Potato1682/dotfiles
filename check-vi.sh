if [ -f /bin/vim ]; then 
  yay -R vim --noconfirm
fi

if [ -L /bin/vi ]; then
  sudo rm /bin/vi
fi

if [ -f /bin/vi && ! -L /bin/vi ]; then
  yay -R vi --noconfirm
fi
