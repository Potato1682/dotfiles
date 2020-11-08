if [ -f /bin/vim ]; then 
  pikaur -R vim --noconfirm
fi

if [ -f /bin/vi -a ! -L /bin/vi ]; then
  pikaur -R vi --noconfirm
fi

