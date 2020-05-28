if [ -f /bin/vim ]; then 
  yay -R vim --noconfirm
fi

fakeroot

if [ -L /bin/vi ]; then
  sudo rm /bin/vi
fi
exit

if [ -f /bin/vi && ! -L /bin/vi ]; then
  yay -R vi --noconfirm
fi
